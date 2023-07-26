#!/bin/bash
systemctl stop clash

CLASH_HOME=$(cd $(dirname $0); pwd)
cd ${CLASH_HOME}

#为所有sh加删除权限
chmod -x  clash.sh clash-start.sh  clash-stop.sh

#删除clash服务
rm /usr/lib/systemd/system/clash.service
echo "/usr/lib/systemd/system/clash.service has been delete"


#删除环境变量
rm /etc/profile.d/clash_env.sh
echo "/etc/profile.d/clash_env.sh has been delete"

systemctl daemon-reload

