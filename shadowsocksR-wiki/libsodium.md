# 安装libsodium

如果要使用 salsa20 或 chacha20 或 chacha20-ietf 算法，请安装 libsodium :

centos：
```
yum install epel-release
yum install libsodium
```

如果想自己编译，那么可以用以下的命令
```
yum -y groupinstall "Development Tools"
wget https://github.com/jedisct1/libsodium/releases/download/1.0.12/libsodium-1.0.12.tar.gz
tar xf libsodium-1.0.12.tar.gz && cd libsodium-1.0.12
./configure && make -j2 && make install
echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig
```

ubuntu/debian：
```
apt-get install build-essential
wget https://github.com/jedisct1/libsodium/releases/download/1.0.12/libsodium-1.0.12.tar.gz
tar xf libsodium-1.0.12.tar.gz && cd libsodium-1.0.12
./configure && make -j2 && make install
ldconfig
```

如果曾经安装过旧版本，亦可重复用以上步骤更新到最新版，仅1.0.4或以上版本支持chacha20-ietf