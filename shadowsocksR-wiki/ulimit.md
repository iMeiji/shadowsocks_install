<h1>修改系统连接数</h1>
<p>如果运行一段时间后，你发现服务器无法连接，同时ssh连上去后，查log的时候发现报很多这种错误<code>Too many open files</code>，那么是达到了系统的最大文件数</p>
<p>如果是ubuntu/centos均可修改<code>/etc/sysctl.conf</code></p>
<p>找到<code>fs.file-max</code>这一行，修改其值为1024000，并保存退出。然后执行<code>sysctl -p</code>使其生效</p>
<p>打开文件<code>/etc/security/limits.conf</code></p>
<p>添加两行：</p>
<pre><code>*               soft    nofile           512000
*               hard    nofile          1024000
</code></pre>
<p>针对centos,还需要于/etc/pam.d/login检查有没有session required pam_limits.so，没有就加上
保存后，重启操作系统生效</p>
<p>针对ubuntu系统，你还需要额外的在运行前使用ulimit命令设置最大文件数，可使用附带的运行脚本。</p>
<p>如果使用supervisor进程守护，需要修改文件<code>/etc/default/supervisor</code>，添加一行：<br>
<code>ulimit -n 512000</code><br>
还可以在supervisord.conf的supervisord字段下添加minfds=512000来提升文件描述符限制<br>
针对centos7，你还需要在/usr/lib/systemd/system/supervisord.service的service段添加<br>
<code>LimitNOFILE=512000</code><br>
再启动你的服务</p>
