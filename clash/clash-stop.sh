#!/bin/bash

CLASH_HOME=$(cd $(dirname $0); pwd)

if [ -f "${CLASH_HOME}/pid" ];then
	clash_pid="$(cat ${CLASH_HOME}/pid)"
	kill -9 ${clash_pid}	
	rm ${CLASH_HOME}/pid
	source /etc/profile
	echo “clash已终止。PID${clash_pid}”
else
	echo "没有运行中的clash"
fi
