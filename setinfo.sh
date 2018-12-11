#! /bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

echo "Start Config..."
downpath='/data/'
if [ ! -d "${downpath}" ];then
    mkdir ${downpath}
fi

#执行替换操作
cp /etc/ccaa/caddy.conf.template /etc/ccaa/caddy.conf
sed -i "s|dir=.*$|dir=${downpath}|g" /etc/ccaa/aria2.conf
sed -i "s|rpc-secret=.*$|rpc-secret=${SECRET}|g" /etc/ccaa/aria2.conf
sed -i "s|username|${CADDYUSER}|g" /etc/ccaa/caddy.conf
sed -i "s|password|${CADDYPASS}|g" /etc/ccaa/caddy.conf
sed -i "s|/admin|/admin ${downpath}|g" /etc/ccaa/caddy.conf

/usr/sbin/ccaa start
bash /etc/ccaa/upbt.sh
echo '-------------------------------------------------------------'
echo "All Services Started !"
echo 'Caddy Username:' ${CADDYUSER}
echo 'Caddy Password:' ${CADDYPASS}
echo 'Aria2 RPC Secret:' ${SECRET}
echo 'Download Dir:' ${downpath}
echo '-------------------------------------------------------------'
while true
do
   sleep 1d
   #自动更新BT Tracker使用，不需要可以注释掉
   bash /etc/ccaa/upbt.sh
done
