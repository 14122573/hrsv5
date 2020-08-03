#!/bin/bash

cd `dirname $0`
export LANG='zh_CN.UTF-8'
# shell script execution directory
SH_EXEC_DIR=$(cd $(dirname $0); pwd)
# Get system bits
OS_BIT=`getconf LONG_BIT`

ROOT_DIR=./
YEAR=`date -d now +%Y`
MONTH=`date -d now +%Y%m`
DAY=`date -d now +%Y%m%d`

LOG_YEAR_DIR=$ROOT_DIR$YEAR/
LOG_DIR=$LOG_YEAR_DIR$MONTH/

#标准输出日志
LOG_OUT_FILE=$LOG_DIR$DAY"TriggerOut".log
echo "标准输出日志"$LOG_OUT_FILE

#标准输出错误日志
LOG_ERR_FILE=$LOG_DIR$DAY"TriggerErr".log
echo "标准输出错误日志"$LOG_ERR_FILE

if [ ! -d $LOG_YEAR_DIR ]; then
 mkdir -m 755 $LOG_YEAR_DIR  
fi

if [ ! -d $LOG_DIR ]; then
 mkdir -m 755 $LOG_DIR  
fi

cd ${SH_EXEC_DIR}
nohup ${SH_EXEC_DIR}/jre/linux/${OS_BIT}/jre/bin/java -Dorg.eclipse.jetty.server.Request.maxFormContentSize=99900000 -Dproject.name=hrds_Trigger -Dproject.dir=${SH_EXEC_DIR} -jar hrds_Trigger-5.0.jar  sys.code=$1 1>>$LOG_OUT_FILE 2>>$LOG_ERR_FILE &
exit 0

