#!/bin/bash
#####	一键安装Caddy + Aria2 + AriaNg		#####
#####	更新时间：2018-12-8  				#####

#导入环境变量
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin
export PATH

function up_tracker(){
	#下载最新的bt-tracker
	trackers=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt | grep . | tr '\n' ',' | sed "s|,$||"`
	#替换处理bt-tracker
	bt_tracker="bt-tracker="${trackers}
	echo ${bt_tracker}
	#更新aria2配置
	sed -i '/bt-tracker.*/'d /etc/ccaa/aria2.conf
	echo ${bt_tracker} >> /etc/ccaa/aria2.conf
	echo '-------------------------------------'
	echo 'bt-tracker update completed.'
	echo '-------------------------------------'
}

up_tracker

#重启服务
/usr/sbin/ccaa restart