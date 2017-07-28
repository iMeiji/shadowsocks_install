   <h1>
<a id="user-content-python版客户端使用教程" class="anchor" href="#python%E7%89%88%E5%AE%A2%E6%88%B7%E7%AB%AF%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>python版客户端使用教程</h1>
<h2>
<a id="user-content-基本库安装" class="anchor" href="#%E5%9F%BA%E6%9C%AC%E5%BA%93%E5%AE%89%E8%A3%85" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>基本库安装</h2>
<p>以下命令均以root用户执行，或sudo方式执行</p>
<p>centos:</p>
<pre><code>yum install git
</code></pre>
<p>ubuntu/debian:</p>
<pre><code>apt-get install git
</code></pre>
<p>windows:</p>
<p><a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/Server-Setup-on-Windows">在Windows上安装服务端/客户端</a></p>
<h2>
<a id="user-content-获取源代码" class="anchor" href="#%E8%8E%B7%E5%8F%96%E6%BA%90%E4%BB%A3%E7%A0%81" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>获取源代码</h2>
<p><code>git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git</code></p>
<p>执行完毕后会在当前目录新建一个shadowsocksr目录。</p>
<p>进入子目录：</p>
<pre><code>cd shadowsocksr/shadowsocks
</code></pre>
<h4>
<a id="user-content-快捷运行" class="anchor" href="#%E5%BF%AB%E6%8D%B7%E8%BF%90%E8%A1%8C" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>快捷运行</h4>
<pre><code>python local.py -s server_ip -p 443 -k password -m aes-256-cfb -o http_simple -O auth_chain_a

#说明：-p 端口 -k 密码  -m 加密方式 -o 混淆插件 -O 协议插件
</code></pre>
<p>如果要后台运行(只有unix系统才可以使用，windows无法后台运行)：</p>
<pre><code>python local.py -s server_ip -p 443 -k password -m aes-256-cfb -d start
</code></pre>
<p>如果要停止/重启(同样的windows无法使用)：</p>
<pre><code>python local.py -d stop/restart
</code></pre>
<p>查看日志：</p>
<pre><code>tail -f /var/log/shadowsocks.log
</code></pre>
<p>用 -h 查看所有参数</p>
<h4>
<a id="user-content-通过配置文件运行" class="anchor" href="#%E9%80%9A%E8%BF%87%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E8%BF%90%E8%A1%8C" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>通过配置文件运行</h4>
<p>建立配置文件 <code>vi /etc/shadowsocks.json</code>,
[可以参考shadowsocksr/config.json来写]</p>
<p>写入以下内容：</p>
<div class="highlight highlight-source-js"><pre>{
    <span class="pl-s"><span class="pl-pds">"</span>server<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>0.0.0.0<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>server_ipv6<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>::<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>server_port<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">8388</span>,
    <span class="pl-s"><span class="pl-pds">"</span>local_address<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>127.0.0.1<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>local_port<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">1080</span>,
    <span class="pl-s"><span class="pl-pds">"</span>password<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>mypassword<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>timeout<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">300</span>,
    <span class="pl-s"><span class="pl-pds">"</span>udp_timeout<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">60</span>,
    <span class="pl-s"><span class="pl-pds">"</span>method<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>aes-256-cfb<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>protocol<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>auth_aes128_md5<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>protocol_param<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span><span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>obfs<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>http_simple<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>obfs_param<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span><span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>fast_open<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">false</span>,
    <span class="pl-s"><span class="pl-pds">"</span>workers<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">1</span>
}</pre></div>
<p>一般情况下，只需要修改以下五项即可：</p>
<pre><code>"server":"0.0.0.0",        //服务器地址
"server_port":8388,        //端口
"password":"password",     //密码
"method":"aes-256-cfb",    //加密方式
"protocol": "auth_aes128_md5",    //协议
</code></pre>
<p>运行:</p>
<pre><code>python local.py -c /etc/shadowsocks.json
</code></pre>
<p>后台运行(只有unix系统才可以使用，windows无法后台运行)：</p>
<pre><code>python local.py -c /etc/shadowsocks.json -d start
</code></pre>
<p>如果要停止/重启(同样的windows无法使用)：</p>
<pre><code>python local.py -d stop/restart
</code></pre>
<p>查看日志：</p>
<pre><code>tail -f /var/log/shadowsocks.log
</code></pre>
<h2>
<a id="user-content-设置代理" class="anchor" href="#%E8%AE%BE%E7%BD%AE%E4%BB%A3%E7%90%86" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>设置代理：</h2>
<p>默认地址：127.0.0.1   默认端口: 1080</p>
<p>注：python版客户端只支持socks代理。</p>
<h1>
<a id="user-content-python-client-setup-guide" class="anchor" href="#python-client-setup-guide" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Python client setup guide</h1>
<h2>
<a id="user-content-basic-setup" class="anchor" href="#basic-setup" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Basic setup</h2>
<p>If not mentioned, the following steps are run by the <code>root</code> user.</p>
<p>CentOS:</p>
<p><code>yum install m2crypto git</code></p>
<p>Ubuntu/Debian:
<code>apt-get install m2crypto git</code></p>
<p>Windows:
<a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/Server-Setup-on-Windows">Server-Setup-on-Windows</a></p>
<h2>
<a id="user-content-obtain-source-code" class="anchor" href="#obtain-source-code" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Obtain source code</h2>
<p><code>git clone -b manyuser https://github.com/breakwa11/shadowsocks.git</code></p>
<p>Enter subdirectory <code>shadowsocks/shadowsocks</code></p>
<h2>
<a id="user-content-running-via-command-line" class="anchor" href="#running-via-command-line" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Running via command line</h2>
<pre><code>python local.py -s &lt;server_ip&gt; \
                -p &lt;port&gt; \
                -k &lt;keyphrase&gt; \
                -m &lt;encryption&gt; \
                -o &lt;obfus&gt; \
                -O &lt;protocol&gt; \
                -l &lt;local_port&gt;
</code></pre>
<p>Replace <code>&lt;variable&gt;</code> with appropriate values.</p>
<p>If require daemonization, append <code>-d start</code> on the above command. To stop or restart, execute
<code>python local.py -d stop # or restart</code>. Note that <code>-d</code> only available on <code>unix</code> like system, not support on windows.</p>
<p>Check logs:</p>
<pre><code>tail -f /var/log/shadowsocks.log
</code></pre>
<p><code>-h</code> shows the documentation.</p>
<h2>
<a id="user-content-running-via-configuration-file" class="anchor" href="#running-via-configuration-file" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Running via configuration file</h2>
<p>Create a configuration file at <code>/etc/shadowsocks.json</code></p>
<p>Write the configuration:</p>
<div class="highlight highlight-source-js"><pre>{
    <span class="pl-s"><span class="pl-pds">"</span>server<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>0.0.0.0<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>server_ipv6<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>::<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>server_port<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-k">&lt;</span>port<span class="pl-k">&gt;</span>,
    <span class="pl-s"><span class="pl-pds">"</span>local_address<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>127.0.0.1<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>local_port<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">1080</span>,
    <span class="pl-s"><span class="pl-pds">"</span>password<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>&lt;password&gt;<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>timeout<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">300</span>,
    <span class="pl-s"><span class="pl-pds">"</span>method<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>&lt;encryption&gt;<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>obfs<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>&lt;obfs&gt;<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>fast_open<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">false</span>,
    <span class="pl-s"><span class="pl-pds">"</span>workers<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">1</span>
}</pre></div>
<p>Replace <code>&lt;variables&gt;</code> with appropriate values.</p>
<p>Then execute the following commands:</p>
<pre><code>python local.py -c /etc/shadowsocks.json
</code></pre>
<p>You may combine with <code>-d start/restart/stop</code> options to initialize/restart/stop
the daemon. Note that <code>-d</code> only available on <code>unix</code> like system, not support on windows.</p>
<h2>
<a id="user-content-proxy-setup" class="anchor" href="#proxy-setup" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Proxy setup</h2>
<p>Default address: <code>127.0.0.1</code>
Default port: 1080</p>
<p>Note: Python client only supports SOCKS proxy.</p>
<p>Install on Windows server: <a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/Server-Setup-on-Windows">https://github.com/Ssrbackup/shadowsocks-rss/wiki/Server-Setup-on-Windows</a></p>