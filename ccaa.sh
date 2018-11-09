#!/bin/bash
#####	一键安装Caddy + Aria2 + AriaNg		#####
#####	作者：xiaoz.me						#####
#####	更新时间：2018-10-02				#####

#导入环境变量
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/sbin
export PATH

#安装Aria2
function install_aria2(){
	#更新软件
	yum -y update
	yum -y install curl wget unzip gcc make bzip2
	yum -y install epel-release
	yum -y install aria2
	#验证aria2是否安装成功，如果没有换rpm安装
	if [ ! -f "/usr/bin/aria2c" ];then
		wget -c http://soft.xiaoz.org/linux/aria2-1.34.0-linux-gnu-64bit-build1.tar.bz2
		tar jxvf aria2-1.34.0-linux-gnu-64bit-build1.tar.bz2
		cd aria2-1.34.0-linux-gnu-64bit-build1
		make install
		cd ..
	fi
}
#安装caddy
function install_caddy(){
	#一键安装https://caddyserver.com/download/linux/amd64?plugins=http.filemanager&license=personal&telemetry=off
	#curl https://getcaddy.com | bash -s personal http.filemanager
	#安装caddy
	wget http://soft.xiaoz.org/linux/caddy_v0.11.0_linux_amd64_custom_personal.tar.gz -O caddy.tar.gz
	tar -zxvf caddy.tar.gz
	mv caddy /usr/sbin/
	chmod +x /usr/sbin/caddy
	#添加服务
	#mv init/linux-systemd/caddy.service /lib/systemd/system
	#chmod +x /lib/systemd/system/caddy.service
	#开机启动
	#systemctl enable caddy.service
}

#处理配置文件
function dealconf(){
	#创建目录和文件
	mkdir -p /etc/ccaa/
	touch /etc/ccaa/aria2.session
	touch /etc/ccaa/aria2.log
	touch /etc/ccaa/caddy.log
}

#设置账号密码
function setting(){
	#安装AriaNg
	wget http://soft.xiaoz.org/website/AriaNg.zip
	unzip AriaNg.zip
	cp -a AriaNg /etc/ccaa
}
#清理工作
function cleanup(){
	rm -rf *.zip
	rm -rf *.gz
	rm -rf *.txt
	#rm -rf *.conf
	rm -rf init
	rm -rf aria2-1.34.0*
}

install_aria2
install_caddy
dealconf
setting
cleanup
