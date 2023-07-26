#!/bin/bash
CLASH_HOME=$(cd $(dirname $0); pwd)
echo CLASH_HOME="${CLASH_HOME}"

if [ -f "${CLASH_HOME}/pid" ];then
	clash_pid="$(cat ${CLASH_HOME}/pid)"	
	echo “clash已经运行!PID:${clash_pid}”
else
	${CLASH_HOME}/clash.sh -d ${CLASH_HOME} > ${CLASH_HOME}/clash.log & echo $! >${CLASH_HOME}/pid
	source /etc/profile
fi
