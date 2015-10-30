#!/bin/bash
cd /root
rm -rf shadowsocks
apt-get update && apt-get upgrade -y
apt-get install python-pip git python-m2crypto build-essential -y

#download source code
git clone -b manyuser https://github.com/breakwa11/shadowsocks.git
wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz
tar zxf LATEST.tar.gz
cd libsodium*
./configure
make && make install
ldconfig
#echo /usr/local/lib > /etc/ld.so.conf.d/libc.conf

cd /etc/
rm -rf shadowsocks.json
cat > /etc/shadowsocks.json<<EOF
{
    "server":"0.0.0.0",
    "server_ipv6": "[::]",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
        "443":"password1",
	"8888":"password2"
    },
    "timeout":300,
    "method":"chacha20",
    "obfs":"http_simple_compatible",
    "fast_open": false,
    "workers": 1
}
EOF

cd /root/shadowsocks/shadowsocks
python server.py -c /etc/shadowsocks.json -d restart

cd /root
rm -rf shadowsocksR.sh
