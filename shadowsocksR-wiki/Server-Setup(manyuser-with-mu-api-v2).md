# ShadowsocksR 多用户版安装教程

以下命令均以root用户执行，或sudo方式执行

基本库安装

centos：
```
yum install python-setuptools && easy_install pip
yum install git
```
ubuntu/debian：
```
apt-get install python-pip
apt-get install git
```
获取源代码

`git clone -b manyuser https://github.com/shadowsocksrr/shadowsocksr.git`

执行完毕后此目录会新建一个shadowsocks目录，其中根目录的是多用户版（即数据库版），子目录中的是单用户版。

根目录即 ./shadowsocksr

子目录即 ./shadowsocksr/shadowsocks

服务端配置

进入根目录初始化配置(假设根目录在~/shadowsocksr，如果不是，命令需要适当调整)：
```
cd ~/shadowsocksr
bash initcfg.sh
```
安装依赖
```
pip install -r requirements.txt
```
shadowsocksr目录内，复制一份配置 cp config.py.sample config.py 对config.py里以下内容进行相应修改：
```
API_INTERFACE = 'MuApiV2' //修改接口类型

# 修改如下信息
mu_uri = 'http://x5.dev/mu'
node_id = '1'
token = '123'
```
接着，运行脚本`python server.py` 跑起来。

服务端运行与停止

后台运行（无log，ssh窗口关闭后也继续运行）

`./run.sh`

后台运行（输出log，ssh窗口关闭后也继续运行）

`./logrun.sh`

后台运行时查看运行情况

`./tail.sh`

停止运行

./stop.sh

注：通过脚本运行默认日志会保存在根目录的ssserver.log，可手动查看。

更新源代码

如果代码有更新可用本命令更新代码

进入shadowsocksr目录

cd shadowsocksr

执行

git pull

成功后重启ss服务

其它异常

如果你的服务端python版本在2.6以下，那么必须更新python到2.6.x或2.7.x版本
<p>其它参见 <a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/ulimit">https://github.com/Ssrbackup/shadowsocks-rss/wiki/ulimit</a></p>