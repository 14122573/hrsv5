#!/bin/bash

# Shell script execution directory
SH_EXEC_DIR=$(cd $(dirname $0); pwd)
# Jre directory
JRE_DIRECTORY=$(cd "${SH_EXEC_DIR}/../"; pwd)
# MainClass
MainClass="hrds.k.biz.RuleCMDExecute"
# Depend on jar package
CLASSPATH=.:${SH_EXEC_DIR}/hrds_K-5.0.jar:${SH_EXEC_DIR}/resources/:${SH_EXEC_DIR}/../lib/*

# 规则编号
reg_num="${1}"
# 验证日期
verify_date="${2}"

# 脚本运行入口
## 参数1  规则编号 10000001
## 参数2  验证日期 20200202
## 使用方式 sh quality_manage.sh 10000001 20200202
## 返回状态码说明 {0: 执行成功; 1: 参数不合法; -1: 执行失败; 2: 根据规则编号没有找到对应的规则; 3: jre目录不存在}
main(){
    # if no parameter is passed to script then show how to use.
    if [[ $# -eq 0 ]]; then usage;fi
    if [[ $# -ne 2 ]]; then usage; fi
    # Enter the script directory
    cd ${SH_EXEC_DIR}
    # Check jre environment
    if [[ ! -d "${JRE_DIRECTORY}/jre" ]]; then echo "jre does not exist, please check the jre env." ; exit 3; fi
    # Get system bits
    OS_BIT=`getconf LONG_BIT`
    # execute script
    ${JRE_DIRECTORY}/jre/linux/${OS_BIT}/jre/bin/java \
        -Xms128m -Xmx128m \
        -Dproject.name="RULE_VERIFY" \
        -cp ${CLASSPATH} \
        ${MainClass} ${reg_num} ${verify_date}
}

#function usage means how to use this script.
function usage() {
    echo "Usage: $0 REG_NUM VERIFY_DATE"
    echo "for example: $0 10000001 20200202"
    exit 1;
}

# 加载脚本
main "$@"
