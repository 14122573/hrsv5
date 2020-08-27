﻿-- keytable
delete from keytable;
INSERT INTO keytable (key_name,key_value) VALUES ('roleid',20);
INSERT INTO keytable (key_name,key_value) VALUES ('tellers',50);
INSERT INTO keytable (key_name,key_value) VALUES ('batchno',20);
INSERT INTO keytable (key_name,key_value) VALUES ('hrds',20);
INSERT INTO keytable (key_name,key_value) VALUES ('paldbcount',0);

INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('A',0,0);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('B',0,1);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('C',0,2);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('D',0,3);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('E',0,4);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('F',0,5);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('G',0,6);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('H',0,7);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('I',0,8);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('J',0,9);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('K',0,10);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('Cont',0,11);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('Trig',0,12);
INSERT INTO KEYTABLE_SNOWFLAKE (project_id,datacenter_id,machine_id) VALUES ('Rec',0,13);

delete from etl_para;
INSERT INTO etl_para (etl_sys_cd, para_cd, para_val, para_type, para_desc) VALUES ('HRSYS', '#txdate', '#txdate', 'param', '当前跑批日,格式yyyyMMdd');
INSERT INTO etl_para (etl_sys_cd, para_cd, para_val, para_type, para_desc) VALUES ('HRSYS', '#txdate_next', '#txdate_next', 'param', '后一跑批日,格式yyyyMMdd');
INSERT INTO etl_para (etl_sys_cd, para_cd, para_val, para_type, para_desc) VALUES ('HRSYS', '#txdate_pre', '#txdate_pre', 'param', '前一跑批日,格式yyyyMMdd');

delete from sys_role;
INSERT INTO sys_role (role_id,role_name) VALUES ('1001','管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1002','数据采集管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1003','作业管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1004','信息爬虫管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1005','监控管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1006','全文检索管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1007','数据可视化管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1008','监控管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1009','REST接口管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1010','加工管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1011', '机器学习管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('3001', '数据加工管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1012', '流数据管理员');
INSERT INTO sys_role (role_id,role_name) VALUES ('1013', '数据管控管理员');

delete from component_info;
-- insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('A000','系统管理','1','0.98.0','fa-cog','btn-default','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('B000','数据采集','1','0.98.0','fa-cog','btn-warning','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('C000','作业管理','1','0.98.0','fa-book','btn-primary','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('D000','报表管理','1','0.98.0','fa-bar-chart-o','btn-warning','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('E000','爬虫管理','1','0.98.0','fa-bug','btn-success','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('F000','监控管理','1','0.98.0','fa-search','btn-info','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('B001','全文检索','1','0.98.0','fa-crosshairs','btn-danger','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('G000','REST接口','1','0.98.0','fa-bell','btn-purple','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,icon_info,color_info,comp_type,comp_remark) values('H000','加工管理','1','0.98.0','fa-briefcase','btn-pink','1','');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000001','查询引擎','1','0.13.1','2','Hive');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000002','流式计算','1','1.4','2','Spark Streaming');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000003','离线计算','1','2.5.1','2','Hadoop&MapReduce/Berkeley&Spark');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000004','键值存储','1','0.98.11','2','Hbase');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000005','文件存储','1','2.5.1','2','HDFS');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000006','资源管理','1','2.5.1','2','Hadoop&Yarn');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000007','日志收集系统','1','1.5','2','Cloudera&Flume');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000008','消息系统','1','2.9.1','2','Apache&Kafka');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000009','分布式服务','1','3.4.6','2','ZooKeeper');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000010','搜索引擎','1','5.3','2','SolrCloud/Solr');
insert into component_info(comp_id,comp_name,comp_state,comp_version,comp_type,comp_remark) values('1000000011','数据挖掘','1','0.13.1','2','Mahout');

delete from component_menu;
-- sys
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (901, '/userManagement', '99', '用户管理', 'A000', 'el-icon-user-solid');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (902, '/departmentalList', '98', '部门管理', 'A000', 'el-icon-s-cooperation');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (903, '/systemParameters', '97', '系统参数管理', 'A000', 'el-icon-s-order');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (904, '/dataStoreLayer', '95', '数据存储层定义', 'A000', 'el-icon-s-unfold');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (905, '/typeLengthContrastInfo', '94', '类型长度对比信息', 'A000', 'el-icon-search');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (906, '/dataTypeContrastInfo', '93', '数据类型对比信息', 'A000', 'el-icon-search');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (907, '/codeMaintenance', '91', '码值维护', 'A000', 'el-icon-folder-checked');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (908, '/logReview', '92', '日志审查', 'A000', 'el-icon-document');
-- manager
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (201, '/datasourceManagement', '01', '采集管理', 'B000', 'el-icon-s-data');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (202, '/serviceMage', '11', '服务接口管理', 'B000', 'el-icon-chat-line-round');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (203, '/dbm', '37', '标准元管理', 'B000', 'el-icon-s-finance');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (204,'/autonomousAnalysisManage', '21', '自主分析管理', 'B000', 'el-icon-news');
-- operator
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (101, '/collectmonitor', '02', '数据采集', 'B000', 'el-icon-s-data');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (102, '/dataQuery', '27', '资源管理', 'B000', 'el-icon-files');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (103, '/webSqlConsole', '29', 'SQL控制台', 'B000', 'el-icon-monitor');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (104, '/fullTextSearch', '28', '全文检索', 'B000', 'el-icon-search');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (105, '/etlMage', '04', '作业调度', 'B000', 'el-icon-menu');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (106, '/dataMart', '14', '数据加工', 'H000', 'el-icon-connection');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (107, '/serviceUser', '12', '服务接口用户', 'G000', 'el-icon-cpu');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (108, '/marketVersionManage', '48', '版本管理', 'H000', 'el-icon-connection');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (109, '/dataControl', '24', '数据管控', 'K001', 'el-icon-s-finance');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (110, '/dbck', '55', '标准元查看', 'K001', 'el-icon-s-finance');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (111, '/tsb', '38', '表结构对标', 'K001', 'el-icon-receiving');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (112, '/tdb', '39', '表数据对标', 'K001', 'el-icon-film');
INSERT INTO component_menu(menu_id, menu_path, user_type, menu_name, comp_id, menu_remark) VALUES (113,'/autonomousAnalysisOperate', '40', '自主分析操作', 'L001', 'el-icon-s-operation');


delete from department_info;
INSERT INTO department_info (dep_id,dep_name,create_date,create_time,dep_remark) VALUES ('1000000001','第一部门','20160101','120500','');

delete from sys_user;
INSERT INTO sys_user(user_id, create_id, dep_id, role_id, user_name, user_password, user_email, user_mobile, useris_admin, user_type, usertype_group, login_ip, login_date, user_state, create_date, create_time, update_date, update_time, user_remark, token, valid_time) VALUES ('1000', '1000', '1000000001', '1001', '超级管理员', '1', 'ccc@vv.com', '1234567890', '0','00', '91,92,99,98,97,95','11', '11', '1', '88888888', '111111', '88888888', '111111', '888','0', '0');
INSERT INTO sys_user(user_id, create_id, dep_id, role_id, user_name, user_password, user_email,user_mobile, useris_admin, user_type, usertype_group, login_ip, login_date, user_state, create_date,create_time, update_date, update_time, user_remark, token, valid_time) VALUES ('1001', '1000','1000000001', '1001', '全功能管理员', '1', 'ccc@vv.com', '1234567890','0','01', '01,04,11,21,37', null, null, '1', '20181015', '145752', '20181015', '145752', '','0', '0');
INSERT INTO sys_user(user_id, create_id, dep_id, role_id, user_name, user_password, user_email,user_mobile, useris_admin, user_type, usertype_group, login_ip, login_date, user_state, create_date,create_time, update_date, update_time, user_remark, token, valid_time) VALUES ('2001', '1000','1000000001', '1001', '全功能操作员', '1', 'ccc@vv.com', '1234567890','0','02', '02,04,12,14,24,27,40,55', null, null, '1', '20181015', '145752', '20181015', '145752', '', '0', '0');



delete from interface_info;
INSERT INTO interface_info VALUES (104, 'tableUsePermissions', '表使用权限查询接口', '1', '1', '01-123', null, 1001);
INSERT INTO interface_info VALUES (105, 'generalQuery','单表普通查询接口', '1', '1', '01-124',NULL,  1001);
INSERT INTO interface_info VALUES ('111', 'tableStructureQuery', '表结构查询接口', '1', '1', '01-130', NULL, '1001');
INSERT INTO interface_info VALUES ('114', 'fileAttributeSearch', '文件属性搜索接口', '1', '1', '01-133', NULL, '1001');
INSERT INTO interface_info VALUES ('115', 'sqlInterfaceSearch', 'sql查询接口', '1', '1', '01-134', NULL, '1001');
INSERT INTO interface_info VALUES ('118', 'rowKeySearch', 'rowkey查询', '1', '1', '01-137', null, 1001);
INSERT INTO interface_info VALUES (123, 'uuidDownload', 'UUID数据下载', '2', '1', '01-143', null, 1001);

delete from dq_rule_def;
INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('COL ENUM', '字段枚举检测', '不在范围内的记录数', '检查总记录数', '', '检测目标表名的 目标表关键字段是否在清单值域 内，格式转义需用户直接转义');
INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('COL FK', '字段外键检测', '外键不存在的记录数', '检查总记录数', '', '检测目标表名的 目标表关键字段(，分割多个字段)是否在 比对表表名 的 比对表关键字段 存在 ');
INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('COL NAN', '字段非空', '空的记录数', '检查总记录数', '', '检测目标表名的 目标表关键字段是否非空');
INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('COL PK', '字段主键检测', '主键重复的记录数', '检查总记录数', '', '检测目标表名的 目标表关键字段(，分割多个字段)是否为主键唯一 ');
INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('COL RANG', '字段范围检测', '不在范围内的记录数', '检查总记录数', '', '检测目标表名的 目标表关键字段是否在【范围区间的最小值，范围区间的最大值】内，格式转义需用户直接转义');
INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('COL REGULAR', '字段正则表达式', '不在范围内的记录数', '检查总记录数', '', '检测目标表名的 目标表关键字段是否符合在清单值域 内字段正则表达式');
INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('SQL', '指定sql', '自定义', '自定义', '', '检测指定SQL 的sql规则');
-- INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('SQL FILE', '指定sql文件', '自定义', '自定义', '', '检测指定SQL 路径存在的规则 ');
INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('TAB NAN', '表非空', '', '', '', '检测目标表名是否非空');
-- INSERT INTO dq_rule_def (CASE_TYPE, CASE_TYPE_DESC, INDEX_DESC1, INDEX_DESC2, INDEX_DESC3, REMARK) VALUES ('TAB SIZE', '表数据量增量', '当日增量记录数x', '上日增量记录数y', '(x-y)/y*100', '');

-- 数据质量
delete from dq_help_info;
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b1', '业务指标代码', '新增业务指标时，用户可自定义，如acc_nav。新增完成后不可修改。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b10', '业务口径描述', '从业务层面来描述该业务指标');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b11', '技术口径描述', '从技术层面来描述该业务指标');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b12', '指标单位代码', '此为回显状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b13', '指标单位名', '用户可自定义指标所用单位');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b14', '参数代码', '用户可从下拉框中选择对应的参数代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b15', '参数名', '再选择参数代码后，会默认得到一个参数名。用户也可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b16', '参数描述', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b17', '顺序号', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b18', '区分技术指标', '当指标参数下所有参数都为否，则业务指标和技术指标的关联类型为一对一关系。当指标参数下有一个参数为是（最多一个参数为是），则业务指标和技术指标的关联类型为一对多关系。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b19', '输入类型', '用户可从下拉框中选择对应的输入类型');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b2', '指标名称', '用户可自定义，如累计单位净值');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b20', '输入检验正则式', '用户可自定义正则表达式，右侧的按钮可以检查输入值是否符合正则表达式。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b21', '可选项提供方式', '用户可从下拉框中选择对应的可选项提供方式');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b22', '对应维度类型代码', '用户可从下拉框中选择对应维度类型代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b23', '维度可选层级', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b24', '技术指标代码', '用户可选择对应的技术指标来关联');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b25', '关联类型', '该输入框为回显状态，回显的值根据指标参数列表中是否区分技术指标来决定如果区分技术指标都为否，则该输入框回显一对一如果区分技术指标有一个值为是，则该输入框回显参数');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b26', '关联参数代码', '该输入框为回显状态，回显的值根据是否指标参数列表中是否区分技术指标来决定如果区分技术指标都为否，则该输入框的回显值为空如果区分技术指标有一个值为是，则该输入框调用该行的参数代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b27', '关联参数值', '根据关联类型的值而改变,如果关联类型为参数时，则该输入框可自定义,如果关联类型为一对一时，则该输入框为回显状态，且回显值为空');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b28', '上级指标代码', '该指标代码所对应上级指标代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b29', '指标级别', '该指标代码所对应指标级别');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b3', '英文全称', '用户可自定义，该指标代码的英文全称');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b4', '英文简称', '用户可自定义，该指标代码的英文简称');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b5', '中文拼音首字母', '用户可自定义，该指标名称的中文拼音首字母');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b6', '函数格式', '用户可以按格式fgf_XXX来自定义,如fgf_acc_nav');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b7', '保存精度', '原来记录小数位后位数');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b8', '业务指标的指标主体', '此为回显状态，根据其关联的技术指标的指标主体来回显，可以有多个指标主体');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('b9', '指标单位', '用来记录指标所用单位');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('Catalg', 'DQC服务器上作业程序目录', '请填写DQC服务器上作业程序所在的路径。格式如/etl/DQC/BIN。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('cfgInfo', '系统配置的相关信息', '用户可自定义，填写该系统配置的相关信息。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('crrsDmns', '对应维度类型代码', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d1', '维度类型代码', '新增维度时，用户可自定义，如d_assc_prmt。新增完成后不可修改。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d10', '检验正则式', '检验正则式');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d11', '排序字段', '用户可输入字段名，会按照该字段名排序');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d12', '维度备注', '用户可自定义，对维度添加一些备注信息');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d13', '存储schema', '此处为回显状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d14', '存储表', '用户可自定义。建议填写数据库中存储schema下的表名，否则校验会失败');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d2', '维度类型描述', '用户可自定义，如关联参数');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d3', '数据格式', '可选择日期、数字、整数、文本');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d4', '历史记录方法', '可选择无历史、时间戳、拉链。无历史：代表无历史记录方法时间戳：代表历史中某一个时间点,拉链：代表历史中某一段时间，即有开始时间和结束时间。此选项会影响存储表信息校验的字段');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d5', '是否为技术维度', '选择该维度是否为技术维度');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d6', '输入类型', '可选择日期、数字、下拉、文本');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d7', '可选项提供方式', '只有当输入类型选择下拉时，才可选择。可选择枚举、服务。枚举：代表一次性给予相关数据。服务：代表多次给予相关数据。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d8', '是否缓存', '只有当输入类型选择下拉时，才可选择。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('d9', '默认值', '该下拉框中的值取自于页面最下面列表中的维度值详细，如果列表中没有维度值，则下拉框显示未找到结果');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dAls', '维度别名', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dbNm', '数据库名称', '请填写数据库中对应的名称');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dbPort', '数据库的端口号', '请填写数据库的端口号，如3306');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dbType', '数据库类型', '支持MYSQL,ORACLE,VER');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dDf', '默认值', '内容3');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dDsc', '维度类型描述', '内容2');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dispTime', '设定调度触发时间', '当调度触发方式为定时触发时，可用。 格式为HH:MM:SS，例如19:20:30');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dispType', '选择调度触发方式', '目前支持2种调度触发方式：依赖触发，定时触发,依赖触发：在上游作业完成之后立刻触发.定时触发：在上游作业完成之后，等到了“调度触发时间”所设定的时间时，触发');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dmnsRmrk', '维度备注', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dReg', '输入检验正则式', '内容4');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dSca', '存储schema', '内容5');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dTab', '存储表', 'dfgdfgdfgdfgdfhdh');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('dTyp', '维度类型代码', '内容1');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('errSql', '查询问题明细的sql语句', '检测sql不通过时最关心的数据明细，如:SELECT  DISTINCT WIND_CODE,INDICATOR_NAMEFROM  SFULL.S34_FUND_MOMENT_INDICATOR');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('etlCd', '调度系统', '请填写相应的调度系统，如EDW');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('etlIp', 'DQC服务器数据库的IP地址', '请填写DQC服务器数据库的IP地址。格式如192.168.30.9');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('etlJob', '调度作业名', '用户可自定义，如EDW_BKUP_SCEMA_APDSP');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('etlpass', 'DQC服务器数据库的用户名和密码', '请填写DQC服务器数据库的用户名和密码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('etlPort', 'DQC服务器数据库的端口号', '请填写DQC服务器数据库的端口号，如22');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('etlUser', 'DQC服务器数据库的用户名和密码', '请填写DQC服务器数据库的用户名和密码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('fields', '需要检测的关键字段', '用户可以填写一个或者多个关键字段，多个关键字段请用，隔开。格式如Pty_Id,Pty_Typ_Cd,ETL_Src_Tab');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('firstCN', '中文拼音首字母', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('flag', '定义规则级别', '分为警告和严重级别。如果规则为警告级别，处理当前作业时，只会返回脚本运行结果，如果运行结果是成功，则继续执行后续依赖作业。如果规则为严重级别，处理当前作业时，检查结果有异常，无论运行结果是成功还是失败，都会停止后续依赖作业。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('index1', '描述检测指标1的含义', '只有当规则类型选择指定sql/指定sql文件/字段正则表达式时可用，用户可以填写相关内容来描述sql语句中第二个返回值的含义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('index2', '描述检测指标2的含义', '只有当规则类型选择指定sql/指定sql文件/字段正则表达式时可用，用户可以填写相关内容来描述sql语句中第三个返回值的含义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('index3', '描述检测指标3的含义', '只有当规则类型选择指定sql/指定sql文件/字段正则表达式时可用，用户可以填写相关内容来描述sql语句中第四个返回值的含义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('ip', '数据库的IP地址', '请填写数据库的IP地址，格式如192.168.40.114');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('jobType', '作业程序类型', '支持2种作业程序类型。PERL：常见的PERL类型WF： WF作业类型，判断文件是否存在');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('limit', '检查表名时限定条件', '检查表名时，用户可以填写一些限定条件。格式如ETL_Upd_Date=''#{TX_DATE}''');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('listVals', '设定一个清单作为值域范围', '必填项。当规则类型选择字段枚举检测或字段正则表达式时可用。用户可以填写文本，日期或者数字作为值域范围；文本需要加单引号，如''A08'',''A02'',''A11'',''A10''日期也需要加单引号，如''2017-07-28'',''2017-07-08''数字不需要加单引号，如1,23,567');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('log', 'DQC服务器上作业日志目录', '请填写DQC服务器上作业日志所在的路径。格式如/etl/DQC/ERR_DATA');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('logDic', '作业日志目录', '请填写对应作业日志所在的路径，并且其子文件夹按日期排序，日期必须使用变量名，其余可使用变量名也可使用具体数值。格式如!{ETLLOG}@#{txdate}@!{XX}或者/etl/ETL/LOG/@#{txdate}@/');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('max', '设定范围区间的最大值', '只有当规则类型选择字段范围检测/表数据量增量时可用，用户可以填写数值来设定范围区间最大值，如30001231');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('min', '设定范围区间的最小值', '只有当规则类型选择字段范围检测/表数据量增量时可用，用户可以填写数值来设定范围区间最小值，如20100101');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('mnBdyCd', '指标主体代码', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('mnBdyDsc', '指标主体名称', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('offset', '根据调度频率填写具体的时间', '必填项。此输入框与调度频率有关。填写规则如下：1）默认值0；2）天时，忽略此字段值；3）月时，0-表示月初，正N-表示本月第N天，负N-表示本月倒数第N天；4）周、年时与月相同；例如，调度频率选择月时，调度时间位移填写5，则表示每月第5天进行调度');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('opField', '和当前检测的关键字段做比对', '用户可以填写一个或者多个关键字段，多个关键字段请用，隔开。格式如Pty_Id,Pty_Typ_Cd,ETL_Src_Tab');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('opTab', '和当前检测的表做比对', '只有当规则类型选择字段外键检测时可用，用户可以变量名加表名的形式填写。格式如#{PDATA}.T02_PARTY');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('optnLvl', '维度可选层级', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('ordrClmn', '排序字段', '按SQL Order By 语法格式存放');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('password', '数据库的用户名和密码', '请填写数据库的用户名和密码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('phyFld', '物理表字段名', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('prity', '作业的优先级设定', '数字越大，优先级越高。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('prmtCd', '关联参数代码', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('prmtDsc', '参数描述', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('prmtNm', '参数名称', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('proDic', '作业程序目录', '请填写对应作业程序所在的路径，可以填写变量名，也可以使用具体路径。格式如!{ETLBIN}或者/etl/ETL/BIN/');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('proName', '作业程序名', '请填写对应作业程序名称。格式如delhisdata.pl');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('proPara', '作业程序参数', '请填写对应作业程序参数，参数之间用@符号分隔。例如：aaa@1@2');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('regName', '定义规则名称', '用户可自定义，例如RN_COL_FK_001的主键规则');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('ruleSrc', '规则来源', '用户自定义，填写内容为：哪个人或者哪个部门提出了这条规则');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('ruleTag', '将规则分类并定义相关的标签', '用户可自定义，例如主键规则');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('ruleType', '选择规则类型', '支持10种规则类型。1. COL ENUM：字段枚举检测      字段级-枚举值校验。字段值在枚举列表中返回0，否则返回非0。2. COL FK：字段外键检测      字段级-外键校验。字段外键关系全部成立，则返回0，否则返回非0。3. COL NAN：字段非空      字段级-非空字段校验。字段中没有空值，则返回0，否则返回非0。4. COL PK：字段主键检测      字段级-主键校验。字段不存在重复，则返回0，否则返回非0。5. COL RANG：字段范围检测     字段级-范围校验。字段在指定范围，返回0，否则返回非0。6. COL REGULAR：字段正则表达式      字段级-正则表达式校验。字段内容符合正则表达式返回0，否则返回非0。7. SQL：指定sql      使用指定SQL，即specify_sql字段。用于比较简单的规则。8. SQL FILE：指定sql文件      使用指定SQL，即specify_sql字段，比较复杂的sql，填写sql文件路径。9. TAB NAN：表非空      表级-非空表校验。表为非空，则返回0，空返回其他值 10. TAB SIZE：表数据量增量     表级-表数据量校验。数据环比增量比例在范围区间内，则返回0，否则返回非0。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s1', '数据集代码', '新增数据集时，用户可自定义，如fgf_hldn_pnsn_dtl。新增完成后不可修改。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s10', '是否替换变量', '用户可从下拉框中选择');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s11', '保存精度', '用户可自定义，记录小数点后位数');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s12', '显示名称', '用户可自定义，为该字段的显示名称');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s13', '输入格式', '用户可从下拉框中选择Date, Number, Text');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s14', '显示格式', '用户可从下拉框中选择Date, Number, Text');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s15', '对应维度类型代码', '用户可从下拉框中选择对应维度类型代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s16', '维度可选层级', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s17', '代码转换', '用户可从下拉框中选择');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s18', '数据集代码', '此为回显状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s19', '上级指标代码', '该数据集代码所对应上级数据集代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s2', '数据集描述', '用户可自定义，如养老金持仓明细表');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s20', '指标级别', '该数据集代码所对应数据集层级');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s3', '过滤条件', 'sql 语法，不带where 关键字，会与其他过滤条件合并，例如：C1=''123''   AND (C2<=1  OR C3<>1)');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s4', '历史记录方法', 'Z拉链, 默认带查询条件  数据日期#{dt}           数据表必须有字段 ： strt_dt，end_dt           查询条件为：strt_dt<=#{dt} and end_dt>#{dt}N无历史,无特殊处理T时间戳 ,无特殊处理');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s5', '存储表', '用户可填写sql语句或者数据库对应表名');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s6', '字段名称', '用户需要填写存储表中填写sql语句或者数据库表所包含的字段');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s7', '顺序号', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s8', '查询字段', '选是，则会先在数据集操作界面中的查询字段列表下显示选否，则不显示');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('s9', '是否输出字段', '选是，则会先在数据集操作界面中的输出字段列表下显示选否，则不显示');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('scaduleF', '调度状态', '显示当前规则的调度状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('seqId', '顺序号', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('sql', '通过sql语句检测', '只有当规则类型选择指定sql可用，用户可以填写相关sql语句。sql语句要求： 1. 必须由2句sql构成,并以 ";" 分隔 2. 第一句sql(统计不在范围的记录数)的查询结果列必须包含COUNT(1) AS index1,第二句sql(检查记录总数)的查询结果列必须包含COUNT(1) AS index2 3. sql语句可以使用变量，变量需要事先在系统变量功能中进行配置。“#{TX_DATE10}”和“#{TX_DATE}”为系统保留的变量，分别表示10位和8位的批量日期，可直接引用。如：SELECT 1 , COUNT(1),count(1)+1，2 FROM  !{SFULL}.S34_FUND_MOMENT_INDICATOR WHERE TO_DATE(BATCH_DATE,''YYYYMMDD'')=DATE(''#{TX_DATE10}'') AND TO_DATE(BATCH_DATE,''YYYYMMDD'')=DATE(''#{TX_DATE}'')');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('subCd', '调度子系统的代码编号', '请填写对应的调度子系统的代码编号，如APDSP');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('sysId', '系统编号', '用户可自定义，例如MYS，ORA');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('sysNm', '系统名称', '用户可自定义，例如etl测试环境mysql库');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('sysNum', '给变量名赋值', '用户可自定义，例如FGKM注：不可填写特殊字符');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('sysVar', '定义变量名', '用户可自定义，不过需要按#{XXX}的形式命名，例如#{FGKM}注意：不可用#{TX_DATE10}和#{TX_DATE}');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t1', '技术指标代码', '新增指标时，用户可自定义。新增完成后，不可修改');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t10', '技术口径描述', '从技术层面来描述该业务指标');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t11', '技术含义SQL', '是否落地为否时填写填写指标生成的带参数的SQL代码,参数代码格式（#{参数代码}）');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t12', '备注', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t13', '存储schema', '此为回显状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t14', '存储表', '用户可自定义。建议填写数据库中存储schema下的表名，否则校验会失败');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t15', '指标存储字段', '用户可自定义。建议填写数据库中存储schema下表名中的字段名，否则校验会失败');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t16', '关联类型', '此为回显状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t17', '关联参数代码', '此为回显状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t18', '关联参数值', '此为回显状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t19', '指标主体代码', '此为回显状态');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t2', '指标名称', '用户可自定义，如持仓份额');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t20', '指标主体名称', '用户可自定义指标主体的名称');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t21', '维度别名', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t22', '物理表字段名', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t23', '对应参数代码', '用户可从下拉框中选择对应的参数代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t24', '对应维度类型代码', '用户可从下拉框中选择对应的维度类型代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t25', '维度可选层级', '用户可自定义');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t26', '上级指标代码', '该指标代码所对应上级指标代码');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t27', '指标级别', '该指标代码所对应指标级别');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t3', '业务归属部门', '用户可从下拉框中选择指标所属部门');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t4', '归属业务指标', '此为回显状态，显示该指标属于哪个业务指标。点击查看按钮，可查看业务指标的详细信息。该指标与归属业务指标关联关系可在业务指标关联的技术指标清单中编辑。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t5', '指标来源', '用户可自定义，描述该指标来源于哪');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t6', '指标数据类型', '可选择日期，数字，整数，文本');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t7', '指标类型', '可选择基础和派生基础为直接从业务系统取数，派生为数据仓库加工');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t8', '是否落地', '选择是时，则校验存储表信息选择否时，则校验技术含义SQL');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('t9', '指标主体', '用户可选择对应的指标主体，技术指标只有一个指标主体。用户可新增和删除指标主体。');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('targTab', '需要检测的表名', '用户可以变量名加表名的形式填写，格式如!{PDATA}.T01_PARTY。注意：#{TX_DATE10}和#{TX_DATE}变量不可以被填写!');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tCd', '技术指标代码', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tDsc', '指标名称', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tFld', '指标存储字段', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('time', '设定调度触发时间', '当调度触发方式为定时触发时，可用。格式为HH:MM:SS，例如19:20:30');
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tLvl', '指标级别', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tRmrk', '备注', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tRngDc', '技术口径描述', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tSQL', '技术含义SQL', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tSrc', '指标来源', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('tUpCd', '上级指标代码', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('unitCd', '指标单位代码', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('unitDsc', '指标单位名称', null);
INSERT INTO dq_help_info (help_info_id, help_info_desc, help_info_dtl) VALUES ('usr', '数据库的用户名和密码', '请填写数据库的用户名和密码');
