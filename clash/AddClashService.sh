#!/bin/bash
CLASH_HOME=$(cd $(dirname $0); pwd)
cd ${CLASH_HOME}

#为所有sh加执行权限
chmod +x  clash.sh clash-start.sh  clash-stop.sh

#服务化
cat > /usr/lib/systemd/system/clash.service << EOF
[Unit]
Description=clash
[Service]
TimeoutStartSec=0
ExecStart=$CLASH_HOME/clash-start.sh
ExecStop=$CLASH_HOME/clash-stop.sh
RemainAfterExit=yes
[Install]
WantedBy=multi-user.target
EOF
echo "add clash service success: /usr/lib/systemd/system/clash.service"


#设置环境变量
cat > /etc/profile.d/clash_env.sh << EOF
if [ -f "${CLASH_HOME}/pid" ];then
	export http_proxy=http://127.0.0.1:7890
	export https_proxy=http://127.0.0.1:7890
else
	#unset http_proxy
	#unset https_proxy
	export -n http_proxy
	export -n https_proxy
fi
EOF
echo "add clash env success: /etc/profile.d/clash_env.sh"

systemctl daemon-reload
echo "try 'systemctl start clash'"

