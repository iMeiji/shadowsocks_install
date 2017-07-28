进行完这个操作之后，可以保护你的节点和你数据库之间的连接。

1.请确认你的 Mysql 支持 SSL ，LNMP 默认没有这个支持，需要自己编译。这是是 5.5 版本的方法，其他版本请自己参考 Mysql 官网的方法。
```
service mysql stop
wget http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.50.tar.gz
tar xvzf mysql-5.5.50.tar.gz
cd mysql-5.5.50
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DSYSCONFDIR=/etc -DWITH_MYISAM_STORAGE_ENGINE=1 -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_PARTITION_STORAGE_ENGINE=1 -DWITH_FEDERATED_STORAGE_ENGINE=1 -DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8mb4 -DDEFAULT_COLLATION=utf8mb4_general_ci -DWITH_READLINE=1 -DWITH_EMBEDDED_SERVER=1 -DENABLED_LOCAL_INFILE=1 -DWITH_SSL=system
make
make install
service mysql start
```
2.然后就生成证书，按照

http://dev.mysql.com/doc/refman/5.5/en/creating-ssl-files-using-openssl.html

的方法，生成在 /etc/mysql/ 下。

3.然后在 my.cnf 的 [mysqld] 后添加
```
ssl-ca=/etc/mysql/ca.pem
ssl-cert=/etc/mysql/server-cert.pem
ssl-key=/etc/mysql/server-key.pem
```
4.添加完成，重启 mysql

`sevrice mysql restart`

5.重启完毕，然后把 /etc/mysql/ 的 client-cert.pem 和 client-key.pem 和 ca.pem 传到你节点上 ssr mod 的目录下，我这里以 /root/shadowsocks 为例。

6.然后设置 usermysql.json 添加或者设置如下
```
"ssl_enable" = 1
"ssl_ca" = "/root/shadowsocks/client-cert.pem"
"ssl_key" = "/root/shadowsocks/client-key.pem"
"ssl_cert" = "/root/shadowsocks/ca.pem"
```
重启节点上的程序，搞定。