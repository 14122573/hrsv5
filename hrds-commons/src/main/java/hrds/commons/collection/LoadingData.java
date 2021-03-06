package hrds.commons.collection;

import fd.ng.core.annotation.DocClass;
import fd.ng.core.annotation.Method;
import fd.ng.core.annotation.Param;
import fd.ng.core.annotation.Return;
import fd.ng.db.conf.Dbtype;
import fd.ng.db.jdbc.DatabaseWrapper;
import fd.ng.db.jdbc.SqlOperator;
import hrds.commons.codes.Store_type;
import hrds.commons.collection.bean.LayerBean;
import hrds.commons.collection.bean.LayerTypeBean;
import hrds.commons.collection.bean.LoadingDataBean;
import hrds.commons.exception.BusinessException;

import java.util.Map;

@DocClass(desc = "装载数据", author = "博彦科技", createdate = "2020/4/22 0022 上午 11:25")
public class LoadingData {

	private LoadingDataBean ldbbean;

	/*
	 * ldbean:加载数据的实体Bean
	 */
	public LoadingData(LoadingDataBean ldbean) {
		ldbbean = ldbean;
	}

	@Method(desc = "装载数据到存储层-装载到和查询表同一存储层",
		logicStep = "装载数据到存储层-装载到和查询表同一存储层" +
			"1.前提条件,查询的表所在的存储层在同一存储层下")
	@Param(name = "sql", desc = "查询数据的sql", range = "String类型")
	@Param(name = "db", desc = "DatabaseWrapper对象", range = "DatabaseWrapper对象")
	@Return(desc = "存储层id", range = "存储层id")
	public long intoDataLayer(String sql, DatabaseWrapper db) {
		return new LoadingData(ldbbean).intoDataLayer(sql, db, null);
	}

	@Method(desc = "装载数据到存储层-装载到指定存储层",
		logicStep = "装载数据到存储层-装载到指定存储层")
	@Param(name = "sql", desc = "查询数据的sql", range = "String类型")
	@Param(name = "db", desc = "DatabaseWrapper对象", range = "DatabaseWrapper对象")
	@Param(name = "intoLayerBean", desc = "LayerBean对象", range = "LayerBean对象")
	@Return(desc = "存储层id", range = "存储层id")
	public long intoDataLayer(String sql, DatabaseWrapper db, LayerBean intoLayerBean) {
		//初始化返回结果
		long dsl_id = 0;
		//获取解析出来的表属于的存储实体Bean
		LayerTypeBean ltb = ProcessingData.getAllTableIsLayer(sql, db);
		//获取当前操作存储层的实体Bean信息
		LayerBean layerBean = ltb.getLayerBean();
		//如果查询的表是贴源登记的表,则将表名处理成实际表名进行操作
		String ofSql = ProcessingData.getdStoreReg(sql, db);
		//获取存储类型
		LayerTypeBean.ConnType connType = ltb.getConnType();
		//同一个存储层，且是jdbc
		if (LayerTypeBean.ConnType.oneJdbc == connType) {
			dsl_id = layerBean.getDsl_id();
			try (DatabaseWrapper dbDataConn = ConnectionTool.getDBWrapper(db, dsl_id)) {
				if (dbDataConn.getDbtype() == Dbtype.DB2V1 || dbDataConn.getDbtype() == Dbtype.DB2V2) {
					SqlOperator.execute(dbDataConn, "create table " + ldbbean.getTableName() +
						" AS ( SELECT * FROM (" + ofSql + ") as hyren_dqc_temp ) definition only");
					SqlOperator.execute(dbDataConn, "insert into " + ldbbean.getTableName() +
						" ( SELECT * FROM ( " + ofSql + ") as hyren_dqc_temp )");
					dbDataConn.commit();
				} else if (dbDataConn.getDbtype() == Dbtype.TERADATA) {
					SqlOperator.execute(dbDataConn, "create table " + ldbbean.getTableName() + " AS (" +
						ofSql + ") WITH DATA");
					dbDataConn.commit();
				} else if (dbDataConn.getDbtype() == Dbtype.HIVE) {
					SqlOperator.execute(dbDataConn, "create table " + ldbbean.getTableName() + " AS " + ofSql);
				} else if (dbDataConn.getDbtype() == Dbtype.POSTGRESQL) {
					SqlOperator.execute(dbDataConn, "create table " + ldbbean.getTableName() + " AS " + ofSql);
					dbDataConn.commit();
				} else {
					throw new BusinessException(dbDataConn.getDbtype() + " 类型数据库加载数据暂未实现!");
				}
			}
		}
		//同一个存储层,非jdbc
		else if (LayerTypeBean.ConnType.oneOther == connType) {
			//根据当前存储层类型处理数据
			new ProcessingData() {
				@Override
				public void dealLine(Map<String, Object> map) {
					if (Store_type.HIVE == Store_type.ofEnumByCode(layerBean.getStore_type())) {
						//TODO 同一层 HIVE 插入数据暂未实现
						throw new BusinessException("同一层 HIVE 插入数据暂未实现!");
					} else if (Store_type.HBASE == Store_type.ofEnumByCode(layerBean.getStore_type())) {
						//TODO 同一层 HBASE 插入数据暂未实现
						throw new BusinessException("同一层 HBASE 插入数据暂未实现!");
					} else if (Store_type.SOLR == Store_type.ofEnumByCode(layerBean.getStore_type())) {
						//TODO 同一层 SOLR 插入数据暂未实现
						throw new BusinessException("同一层 SOLR 插入数据暂未实现!");
					} else if (Store_type.ElasticSearch == Store_type.ofEnumByCode(layerBean.getStore_type())) {
						//TODO 同一层 ElasticSearch 插入数据暂未实现
						throw new BusinessException("同一层 ElasticSearch 插入数据暂未实现!");
					} else if (Store_type.MONGODB == Store_type.ofEnumByCode(layerBean.getStore_type())) {
						//TODO 同一层 MONGODB 插入数据暂未实现
						throw new BusinessException("同一层 MONGODB 插入数据暂未实现!");
					}
				}
			}.getDataLayer(sql, db);
			dsl_id = layerBean.getDsl_id();
		}
		//所有的表都使用的jdbc的方式，且是多个jdbc，返回 morejdbc
		else if (LayerTypeBean.ConnType.moreJdbc == connType) {
			//TODO 所有表多个JDBC,且不在同一个jdbc
			throw new BusinessException("所有表使用JDBC,且不是同一个jdbc插入数据暂未实现!");
		}
		//多个存储层，且不是jdbc，返回 moreother
		else if (LayerTypeBean.ConnType.moreOther == connType) {
			//TODO 所有表多个存储层，且不在同一个存储层jdbc插入数据暂未实现!");
			throw new BusinessException("所有表多个存储层，且不在同一个存储层jdbc插入数据暂未实现!!");
		}
		return dsl_id;
	}
}
