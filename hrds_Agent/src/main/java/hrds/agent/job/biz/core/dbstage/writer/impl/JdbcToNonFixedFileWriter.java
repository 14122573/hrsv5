package hrds.agent.job.biz.core.dbstage.writer.impl;

import fd.ng.core.utils.FileNameUtils;
import fd.ng.core.utils.StringUtil;
import hrds.agent.job.biz.bean.CollectTableBean;
import hrds.agent.job.biz.bean.TableBean;
import hrds.agent.job.biz.constant.JobConstant;
import hrds.agent.job.biz.core.dbstage.writer.AbstractFileWriter;
import hrds.agent.job.biz.dataclean.Clean;
import hrds.agent.job.biz.dataclean.CleanFactory;
import hrds.agent.job.biz.dataclean.DataCleanInterface;
import hrds.agent.job.biz.utils.WriterFile;
import hrds.commons.codes.DataBaseCode;
import hrds.commons.codes.FileFormat;
import hrds.commons.codes.IsFlag;
import hrds.commons.entity.Data_extraction_def;
import hrds.commons.exception.AppSystemException;
import hrds.commons.utils.Constant;
import org.apache.avro.file.DataFileWriter;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;

/**
 * FileConversion
 * date: 2019/12/6 17:22
 * author: zxz
 */
public class JdbcToNonFixedFileWriter extends AbstractFileWriter {

	//打印日志
	private static final Logger log = LogManager.getLogger();

	public JdbcToNonFixedFileWriter(ResultSet resultSet, CollectTableBean collectTableBean, int pageNum,
	                                TableBean tableBean, Data_extraction_def data_extraction_def) {
		super(resultSet, collectTableBean, pageNum, tableBean, data_extraction_def);
	}

	@SuppressWarnings("unchecked")
	public String writeFiles() {
		String eltDate = collectTableBean.getEtlDate();
		StringBuilder fileInfo = new StringBuilder(1024);
		String hbase_name = collectTableBean.getHbase_name();
		//数据抽取指定的目录
		String plane_url = data_extraction_def.getPlane_url();
		String midName = plane_url + File.separator + eltDate + File.separator + collectTableBean.getTable_name()
				+ File.separator + Constant.fileFormatMap.get(FileFormat.FeiDingChang.getCode()) + File.separator;
		String dataDelimiter = data_extraction_def.getDatabase_separatorr();
		midName = FileNameUtils.normalize(midName, true);
		DataFileWriter<Object> avroWriter = null;
		BufferedWriter writer;
		long counter = 0;
		int index = 0;
		WriterFile writerFile = null;
		try {
			avroWriter = getAvroWriter(tableBean.getTypeArray(), hbase_name, midName, pageNum);
			//卸数文件名为hbase_name加线程唯一标识加此线程创建文件下标
			String fileName = midName + hbase_name + pageNum + index + "." + data_extraction_def.getFile_suffix();
			fileInfo.append(fileName).append(Constant.METAINFOSPLIT);
			writerFile = new WriterFile(fileName);
			writer = writerFile.getBufferedWriter(DataBaseCode.ofValueByCode(data_extraction_def.getDatabase_code()));
			//获取所有字段的名称，包括列分割和列合并出来的字段名称 写表头
			writeHeader(writer, tableBean.getColumnMetaInfo());
			//清洗配置
			final DataCleanInterface allclean = CleanFactory.getInstance().getObjectClean("clean_database");
			//获取所有查询的字段的名称，不包括列分割和列合并出来的字段名称
			List<String> selectColumnList = StringUtil.split(tableBean.getAllColumns(), Constant.METAINFOSPLIT);
			Map<String, Object> parseJson = tableBean.getParseJson();
			Map<String, String> mergeIng = (Map<String, String>) parseJson.get("mergeIng");//字符合并
			Clean cl = new Clean(parseJson, allclean);
			//获取所有列的值用来做列合并
			StringBuilder mergeStringTmp = new StringBuilder(1024 * 1024);
			//获取页面选择列算拉链时算md5的列，当没有选择拉链字段，默认使用全字段算md5
			Map<String, Boolean> md5Col = transMd5ColMap(tableBean.getIsZipperFieldInfo());
			StringBuilder md5StringTmp = new StringBuilder(1024 * 1024);
			StringBuilder sb = new StringBuilder();//用来写一行数据
			StringBuilder sb_ = new StringBuilder();//用来写临时数据
			List<String> typeList = StringUtil.split(tableBean.getAllType(), Constant.METAINFOSPLIT);
			int numberOfColumns = selectColumnList.size();
			log.info("type : " + typeList.size() + "  colName " + numberOfColumns);
			String currValue;
			int[] typeArray = tableBean.getTypeArray();
			while (resultSet.next()) {
				// Count it
				counter++;
				md5StringTmp.delete(0, md5StringTmp.length());
				mergeStringTmp.delete(0, mergeStringTmp.length());
				// Write columns

				for (int i = 0; i < numberOfColumns; i++) {
					//获取原始值来计算 MD5
					sb_.delete(0, sb_.length());
					mergeStringTmp.append(getOneColumnValue(avroWriter, counter, pageNum, resultSet, typeArray[i],
							sb_, selectColumnList.get(i), hbase_name, midName));
					// Add DELIMITER if not last value
					if (i < numberOfColumns - 1) {
						mergeStringTmp.append(Constant.DATADELIMITER);
					}
					currValue = sb_.toString();
					//判断是否是算md5的列，算md5
					if (md5Col.get(selectColumnList.get(i)) != null && md5Col.get(selectColumnList.get(i))) {
						md5StringTmp.append(currValue);
					}
					//清洗操作
					if(!parseJson.isEmpty()){
						currValue = cl.cleanColumn(currValue, selectColumnList.get(i).toUpperCase(), null,
								typeList.get(i), FileFormat.FeiDingChang.getCode(), null,
								data_extraction_def.getDatabase_code(), dataDelimiter);
					}
					// Write to output
					sb.append(currValue).append(dataDelimiter);
				}
				//如果有列合并处理合并信息
				if (mergeIng!=null && !mergeIng.isEmpty()) {
					List<String> arrColString = StringUtil.split(mergeStringTmp.toString(),
							Constant.DATADELIMITER);
					String merge = allclean.merge(mergeIng, arrColString.toArray(new String[0]),
							selectColumnList.toArray(new String[0]), null, null,
							FileFormat.FeiDingChang.getCode(), data_extraction_def.getDatabase_code(), dataDelimiter);
					sb.append(merge).append(dataDelimiter);
				}
				sb.append(eltDate);
				//根据是否算MD5判断是否追加结束日期和MD5两个字段
				if (IsFlag.Shi.getCode().equals(collectTableBean.getIs_md5())) {
					String md5 = toMD5(md5StringTmp.toString());
					sb.append(dataDelimiter).append(Constant.MAXDATE).
							append(dataDelimiter).append(md5);
				}
				//拼接操作时间、操作日期、操作人
				appendOperateInfo(sb, dataDelimiter);
				sb.append(data_extraction_def.getRow_separator());
				if (JobConstant.WriteMultipleFiles) {
					long messageSize = sb.toString().length();
					long singleFileSize = new File(fileName).length();
					if (singleFileSize + messageSize > JobConstant.FILE_BLOCKSIZE) {
						//当文件满足阈值时 ，然后关闭当前流，并创建新的数据流
						writerFile.bufferedWriterClose();
						index++;
						fileName = midName + hbase_name + pageNum + index + "." + data_extraction_def.getFile_suffix();
						writerFile = new WriterFile(fileName);
						writer = writerFile.getBufferedWriter(DataBaseCode.ofValueByCode(
								data_extraction_def.getDatabase_code()));
						//获取所有字段的名称，包括列分割和列合并出来的字段名称 写表头
						writeHeader(writer, tableBean.getColumnMetaInfo());
						fileInfo.append(fileName).append(Constant.METAINFOSPLIT);
					}
				}
				writer.write(sb.toString());
				if (counter % JobConstant.BUFFER_ROW == 0) {
					log.info("正在写入文件，已写入" + counter + "行");
					writer.flush();
				}
				sb.delete(0, sb.length());
			}
			writer.flush();
			//写meta数据开始
		} catch (Exception e) {
			log.error("卸数失败", e);
			throw new AppSystemException("数据库采集卸数非定长文件失败" + e.getMessage());
		} finally {
			try {
				if (writerFile != null)
					writerFile.bufferedWriterClose();
				if (avroWriter != null)
					avroWriter.close();
			} catch (IOException e) {
				log.error(e);
			}
		}
		fileInfo.append(counter);
		//返回卸数一个或者多个文件名全路径和总的文件行数
		return fileInfo.toString();
	}

	/**
	 * 根据页面传过来的参数，决定是否写表头
	 *
	 * @param writer         定长的写文件的输出流
	 * @param columnMetaInfo 所有字段的列
	 */
	private void writeHeader(BufferedWriter writer, String columnMetaInfo) throws Exception {
		if (IsFlag.Shi.getCode().equals(data_extraction_def.getIs_header())) {
			if (!StringUtil.isEmpty(data_extraction_def.getDatabase_separatorr())) {
				columnMetaInfo = StringUtil.replace(columnMetaInfo, Constant.METAINFOSPLIT,
						data_extraction_def.getDatabase_separatorr());
			} else {
				throw new AppSystemException("非定长文件，列分隔符不能为空");
			}
			writer.write(columnMetaInfo);
			writer.write(data_extraction_def.getRow_separator());
		}
	}

	/**
	 * 添加操作日期、操作时间、操作人
	 */
	private void appendOperateInfo(StringBuilder sb, String database_separatorr) {
		if (JobConstant.ISADDOPERATEINFO) {
			sb.append(database_separatorr).append(operateDate).append(database_separatorr)
					.append(operateTime).append(database_separatorr).append(user_id);
		}
	}
}
