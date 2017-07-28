<p>#启动脚本</p>
<p>以下启动脚本均假定shadowsocks-rss安装于/usr/local/shadowsocksr目录，配置文件为/usr/local/shadowsocksr/user-config.json，请按照实际情况自行修改</p>
<p>SysVinit启动脚本，适合CentOS/RHEL6系以及Ubuntu 14.x，Debian7.x</p>

```

#!/bin/sh
# chkconfig: 2345 90 10
# description: Start or stop the Shadowsocks R server
#
### BEGIN INIT INFO
# Provides: Shadowsocks-R
# Required-Start: $network $syslog
# Required-Stop: $network
# Default-Start: 2 3 4 5
# Default-Stop: 0 1 6
# Description: Start or stop the Shadowsocks R server
### END INIT INFO

# Author: Yvonne Lu(Min) <min@utbhost.com>

name=shadowsocks
PY=/usr/bin/python
SS=/usr/local/shadowsocksr/shadowsocks/server.py
SSPY=server.py
conf=/usr/local/shadowsocksr/user-config.json

start(){
    $PY $SS -c $conf -d start
    RETVAL=$?
    if [ "$RETVAL" = "0" ]; then
        echo "$name start success"
    else
        echo "$name start failed"
    fi
}

stop(){
    pid=`ps -ef | grep -v grep | grep -v ps | grep -i "${SSPY}" | awk '{print $2}'`
    if [ ! -z "$pid" ]; then
        $PY $SS -c $conf -d stop
        RETVAL=$?
        if [ "$RETVAL" = "0" ]; then
            echo "$name stop success"
        else
            echo "$name stop failed"
        fi
    else
        echo "$name is not running"
        RETVAL=1
    fi
}

status(){
    pid=`ps -ef | grep -v grep | grep -v ps | grep -i "${SSPY}" | awk '{print $2}'`
    if [ -z "$pid" ]; then
        echo "$name is not running"
        RETVAL=1
    else
        echo "$name is running with PID $pid"
        RETVAL=0
    fi
}

case "$1" in
'start')
    start
    ;;
'stop')
    stop
    ;;
'status')
    status
    ;;
'restart')
    stop
    start
    RETVAL=$?
    ;;
*)
    echo "Usage: $0 { start | stop | restart | status }"
    RETVAL=1
    ;;
esac
exit $RETVAL

```

<p>请将上述脚本保存为/etc/init.d/shadowsocks<br>
CentOS/RHEL6 执行:</p>
<pre><code>chmod 755 /etc/init.d/shadowsocks &amp;&amp; chkconfig --add shadowsocks &amp;&amp; service shadowsocks start
</code></pre>
<p>Ubuntu 14.x，Debian7.x 执行:</p>
<pre><code>chmod 755 /etc/init.d/shadowsocks ; update-rc.d shadowsocks defaults ; service shadowsocks start
</code></pre>
<p>systemd脚本，适用于CentOS/RHEL7以上，Ubuntu 15以上，Debian8以上</p>
<p>单用户版</p>
<pre><code>[Unit]
Description=ShadowsocksR server
After=network.target
Wants=network.target

[Service]
Type=forking
PIDFile=/var/run/shadowsocksr.pid
ExecStart=/usr/bin/python /usr/local/shadowsocksr/shadowsocks/server.py --pid-file /var/run/shadowsocksr.pid -c /usr/local/shadowsocksr/user-config.json -d start
ExecStop=/usr/bin/python /usr/local/shadowsocksr/shadowsocks/server.py --pid-file /var/run/shadowsocksr.pid -c /usr/local/shadowsocksr/user-config.json -d stop
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=always

[Install]
WantedBy=multi-user.target
</code></pre>
<p>多用户版</p>
<pre><code>[Unit]
Description=ShadowsocksR server
After=syslog.target
After=network.target

[Service]
LimitCORE=infinity
LimitNOFILE=512000
LimitNPROC=512000
Type=simple
WorkingDirectory=/usr/local/shadowsocksr
ExecStart=/usr/bin/python /usr/local/shadowsocksr/server.py
ExecReload=/bin/kill -s HUP $MAINPID
ExecStop=/bin/kill -s TERM $MAINPID
Restart=always

[Install]
WantedBy=multi-user.target
</code></pre>
<p>请将上述脚本保存为/etc/systemd/system/shadowsocksr.service<br>
并执行<code>systemctl enable shadowsocksr.service &amp;&amp; systemctl start shadowsocksr.service</code></p>
