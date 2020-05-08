package hrds.commons.collection;

import fd.ng.core.annotation.DocClass;
import fd.ng.core.annotation.Method;
import fd.ng.core.annotation.Param;
import fd.ng.core.annotation.Return;
import fd.ng.db.conf.ConnWay;
import fd.ng.db.conf.DbinfosConf;
import fd.ng.db.conf.Dbtype;
import fd.ng.db.jdbc.DatabaseWrapper;
import hrds.commons.codes.DatabaseType;
import hrds.commons.utils.StorageTypeKey;
import hrds.commons.collection.bean.DbConfBean;
import hrds.commons.entity.Database_set;
import hrds.commons.exception.AppSystemException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@DocClass(desc = "数据库直连采集获取数据库连接", author = "WangZhengcheng", createdate = "2019/10/28 14:26")
public class ConnectionTool {

	@Method(desc = "根据数据库配置信息获取数据库连接", logicStep = "" +
			"1、将SourceDataConfBean对象中的内容封装到dbInfo中" +
			"2、获取数据库类型" +
			"3、根据数据库类型获取对应数据库的数据库连接")
	@Param(name = "dbConfigBean", desc = "该对象封装了海云应用服务端发过来的数据库采集连接数据库的信息", range = "DBConfigBean类型对象")
	@Return(desc = "项目中常用的DatabaseWrapper对象", range = "DatabaseWrapper类型对象")
	public static DatabaseWrapper getDBWrapper(DbConfBean dbConfBean) {
		//1、将SourceDataConfBean对象中的内容封装到dbInfo中
		Map<String, String> dbConfig = new HashMap<>();
		dbConfig.put(StorageTypeKey.database_driver, dbConfBean.getDatabase_drive());
		dbConfig.put(StorageTypeKey.jdbc_url, dbConfBean.getJdbc_url());
		dbConfig.put(StorageTypeKey.user_name, dbConfBean.getUser_name());
		dbConfig.put(StorageTypeKey.database_pwd, dbConfBean.getDatabase_pad());
		dbConfig.put(StorageTypeKey.database_type, dbConfBean.getDatabase_type());
		return getDBWrapper(dbConfig);
	}

	/**
	 * 直接通过数据库查询出来的List数据
	 *
	 * @param dbConfig
	 * @return
	 */
	public static DatabaseWrapper getDBWrapper(List<Map<String, Object>> dbConfig) {
		return getDBWrapper(getLayerMap(dbConfig));
	}

	/**
	 * 使用数据库吃信息，返回一个存储层的信息，以map的方式返回，key为用户输入的key，val为val
	 *
	 * @param dbConfig
	 * @return
	 */
	public static Map<String, String> getLayerMap(List<Map<String, Object>> dbConfig) {
		Map<String, String> dbConfigMap = new HashMap<>();
		for (Map<String, Object> dbMap : dbConfig) {
			String key = dbMap.get("storage_property_key").toString();
			String val = dbMap.get("storage_property_val").toString();
			dbConfigMap.put(key, val);
		}
		return dbConfigMap;
	}

	public static DatabaseWrapper getDBWrapper(Map<String, String> dbConfig) {
		//1、将SourceDataConfBean对象中的内容封装到dbInfo中
		DbinfosConf.Dbinfo dbInfo = new DbinfosConf.Dbinfo();
		dbInfo.setName(DbinfosConf.DEFAULT_DBNAME);
		dbInfo.setDriver(dbConfig.get(StorageTypeKey.database_driver));
		dbInfo.setUrl(dbConfig.get(StorageTypeKey.jdbc_url));
		dbInfo.setUsername(dbConfig.get(StorageTypeKey.user_name));
		dbInfo.setPassword(dbConfig.get(StorageTypeKey.database_pwd));
		dbInfo.setWay(ConnWay.JDBC);
		//2、获取数据库类型
		Dbtype dbType = getDbType(dbConfig.get(StorageTypeKey.database_type));
		if (dbType.equals(Dbtype.HIVE)) {
			dbInfo.setAutoCommit(false);
		}
		dbInfo.setDbtype(dbType);
		dbInfo.setShow_conn_time(true);
		dbInfo.setShow_sql(true);
		//3、根据数据库类型获取对应数据库的数据库连接
		return new DatabaseWrapper.Builder().dbconf(dbInfo).create();
	}

	@Method(desc = "根据数据库配置信息获取数据库连接", logicStep = "" +
			"1、将database_set对象中的内容封装到dbInfo中" +
			"2、获取数据库类型" +
			"3、根据数据库类型获取对应数据库的数据库连接")
	@Param(name = "database_set", desc = "该对象封装了海云应用服务端发过来的数据库采集连接数据库的信息", range = "database_set")
	@Return(desc = "项目中常用的DatabaseWrapper对象", range = "DatabaseWrapper类型对象")
	public static DatabaseWrapper getDBWrapper(Database_set database_set) {
		//1、将SourceDataConfBean对象中的内容封装到dbInfo中
		Map<String, String> dbConfig = new HashMap<>();
		dbConfig.put(StorageTypeKey.database_driver, database_set.getDatabase_drive());
		dbConfig.put(StorageTypeKey.jdbc_url, database_set.getJdbc_url());
		dbConfig.put(StorageTypeKey.user_name, database_set.getUser_name());
		dbConfig.put(StorageTypeKey.database_pwd, database_set.getDatabase_pad());
		dbConfig.put(StorageTypeKey.database_type, database_set.getDatabase_type());
		return getDBWrapper(dbConfig);
	}

	private static Dbtype getDbType(String database_type) {
		//获取数据库类型
		DatabaseType typeConstant = DatabaseType.ofEnumByCode(database_type);
		if (typeConstant == DatabaseType.MYSQL) {
			return Dbtype.MYSQL;
		} else if (typeConstant == DatabaseType.Oracle9i) {
			throw new AppSystemException("系统不支持Oracle9i及以下");
		} else if (typeConstant == DatabaseType.Oracle10g) {
			return Dbtype.ORACLE;
		} else if (typeConstant == DatabaseType.SqlServer2000) {
			return Dbtype.SQLSERVER;
		} else if (typeConstant == DatabaseType.SqlServer2005) {
			return Dbtype.SQLSERVER;
		} else if (typeConstant == DatabaseType.DB2) {
			//TODO 使用db2v1还是db2v2
			return Dbtype.DB2V1;
		} else if (typeConstant == DatabaseType.SybaseASE125) {
			return Dbtype.SYBASE;
		} else if (typeConstant == DatabaseType.Informatic) {
			//Informatic
			throw new AppSystemException("系统不支持该数据库类型");
		} else if (typeConstant == DatabaseType.H2) {
			//H2
			throw new AppSystemException("系统不支持该数据库类型");
		} else if (typeConstant == DatabaseType.ApacheDerby) {
			//ApacheDerBy
			throw new AppSystemException("系统不支持该数据库类型");
		} else if (typeConstant == DatabaseType.Postgresql) {
			return Dbtype.POSTGRESQL;
		} else if (typeConstant == DatabaseType.GBase) {
			return Dbtype.GBASE;
		} else if (typeConstant == DatabaseType.TeraData) {
			return Dbtype.TERADATA;
		} else if (typeConstant == DatabaseType.Hive) {
			return Dbtype.HIVE;
		} else {
			throw new AppSystemException("系统不支持该数据库类型");
		}
	}
}
