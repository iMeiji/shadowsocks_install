#!/bin/sh

# Set Linux PATH Environment Variables
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# Check If You Are Root
if [ $(id -u) != "0" ]; then
    clear
    echo -e "\033[31m Error: You must be root to run this script! \033[0m"
    exit 1
fi

if [ $(arch) == x86_64 ]; then
    OSB=x86_64
elif [ $(arch) == i686 ]; then
    OSB=i386
else
    echo "\033[31m Error: Unable to Determine OS Bit. \033[0m"
    exit 1
fi
if egrep -q "5.*" /etc/issue; then
    OST=5
    wget http://dl.fedoraproject.org/pub/epel/5/${OSB}/epel-release-5-4.noarch.rpm
elif egrep -q "6.*" /etc/issue; then
    OST=6
    wget http://dl.fedoraproject.org/pub/epel/6/${OSB}/epel-release-6-8.noarch.rpm
else
    echo "\033[31m Error: Unable to Determine OS Version. \033[0m"
    exit 1
fi

rpm -Uvh epel-release*rpm
yum install -y libnet libnet-devel libpcap libpcap-devel gcc

wget http://net-speeder.googlecode.com/files/net_speeder-v0.1.tar.gz -O -|tar xz
cd net_speeder
if [ -f /proc/user_beancounters ] || [ -d /proc/bc ]; then
    sh build.sh -DCOOKED
    INTERFACE=venet0
else
    sh build.sh
    INTERFACE=eth0
fi

NS_PATH=/usr/local/net_speeder
mkdir -p $NS_PATH
cp -Rf net_speeder $NS_PATH

echo -e "\033[36m net_speeder installed. \033[0m"
echo -e "\033[36m Usage: nohup ${NS_PATH}/net_speeder $INTERFACE \"ip\" >/dev/null 2>&1 & \033[0m"
