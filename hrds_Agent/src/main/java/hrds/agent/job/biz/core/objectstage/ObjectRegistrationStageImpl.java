package hrds.agent.job.biz.core.objectstage;

import com.alibaba.fastjson.JSONObject;
import fd.ng.core.annotation.DocClass;
import fd.ng.core.annotation.Method;
import fd.ng.core.annotation.Return;
import fd.ng.core.utils.DateUtil;
import hrds.agent.job.biz.bean.ObjectTableBean;
import hrds.agent.job.biz.bean.StageParamInfo;
import hrds.agent.job.biz.bean.StageStatusInfo;
import hrds.agent.job.biz.bean.TableBean;
import hrds.agent.job.biz.constant.RunStatusConstant;
import hrds.agent.job.biz.constant.StageConstant;
import hrds.agent.job.biz.core.AbstractJobStage;
import hrds.agent.job.biz.utils.CommunicationUtil;
import hrds.agent.job.biz.utils.JobStatusInfoUtil;
import hrds.commons.codes.AgentType;
import hrds.commons.entity.Data_store_reg;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

@DocClass(desc = "半结构化对象采集登记是否成功实现类", author = "zxz", createdate = "2019/10/24 14:27")
public class ObjectRegistrationStageImpl extends AbstractJobStage {

	//打印日志
	private static final Logger LOGGER = LogManager.getLogger();
	private final ObjectTableBean objectTableBean;

	public ObjectRegistrationStageImpl(ObjectTableBean objectTableBean) {
		this.objectTableBean = objectTableBean;
	}

	@Method(desc = "数据库抽数数据登记阶段处理逻辑，处理完成后，无论成功还是失败，" +
			"将相关状态信息封装到StageStatusInfo对象中返回", logicStep = "")
	@Return(desc = "StageStatusInfo是保存每个阶段状态信息的实体类", range = "不会为null,StageStatusInfo实体类对象")
	@Override
	public StageParamInfo handleStage(StageParamInfo stageParamInfo) {
		long startTime = System.currentTimeMillis();
		LOGGER.info("------------------表" + objectTableBean.getEn_name()
				+ "数据库抽数数据登记阶段开始------------------");
		//1、创建卸数阶段状态信息，更新作业ID,阶段名，阶段开始时间
		StageStatusInfo statusInfo = new StageStatusInfo();
		JobStatusInfoUtil.startStageStatusInfo(statusInfo, objectTableBean.getOcs_id(),
				StageConstant.DATAREGISTRATION.getCode());
		try {
			Data_store_reg data_store_reg = new Data_store_reg();
			data_store_reg.setAgent_id(objectTableBean.getAgent_id());
			data_store_reg.setDatabase_id(objectTableBean.getOdc_id());
			data_store_reg.setTable_id(objectTableBean.getOcs_id());
			data_store_reg.setSource_id(objectTableBean.getSource_id());
			data_store_reg.setCollect_type(AgentType.DuiXiang.getCode());
			data_store_reg.setFile_size(stageParamInfo.getFileSize());
			//TODO 下面这个可为空吧
			data_store_reg.setHyren_name(objectTableBean.getHyren_name());
			data_store_reg.setTable_name(objectTableBean.getEn_name());
			data_store_reg.setOriginal_name(objectTableBean.getZh_name());
			data_store_reg.setOriginal_update_date(DateUtil.getSysDate());
			data_store_reg.setOriginal_update_time(DateUtil.getSysTime());
			data_store_reg.setStorage_date(DateUtil.getSysDate());
			data_store_reg.setStorage_time(DateUtil.getSysTime());
			JSONObject metaInfoObj = new JSONObject();
			TableBean tableBean = stageParamInfo.getTableBean();
			metaInfoObj.put("column", tableBean.getColumnMetaInfo());
			metaInfoObj.put("length", tableBean.getColLengthInfo());
			metaInfoObj.put("fileSize", stageParamInfo.getFileSize());
			metaInfoObj.put("tableName", objectTableBean.getEn_name());
			metaInfoObj.put("type", tableBean.getColTypeMetaInfo());
			data_store_reg.setMeta_info(metaInfoObj.toJSONString());
			CommunicationUtil.addDataStoreReg(data_store_reg, objectTableBean.getOdc_id());
			JobStatusInfoUtil.endStageStatusInfo(statusInfo, RunStatusConstant.SUCCEED.getCode(), "执行成功");
			LOGGER.info("------------------表" + objectTableBean.getEn_name()
					+ "数据库抽数数据登记阶段成功------------------执行时间为："
					+ (System.currentTimeMillis() - startTime) / 1000 + "，秒");
		} catch (Exception e) {
			JobStatusInfoUtil.endStageStatusInfo(statusInfo, RunStatusConstant.FAILED.getCode(), e.getMessage());
			LOGGER.error("表" + objectTableBean.getEn_name()
					+ "数据库抽数数据登记阶段失败：", e);
		}
		//结束给stageParamInfo塞值
		JobStatusInfoUtil.endStageParamInfo(stageParamInfo, statusInfo, objectTableBean
				, AgentType.DuiXiang.getCode());
		return stageParamInfo;
	}

	@Override
	public int getStageCode() {
		return StageConstant.DATAREGISTRATION.getCode();
	}
}
