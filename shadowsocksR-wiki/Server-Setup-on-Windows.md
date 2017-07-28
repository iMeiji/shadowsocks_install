<a id="user-content-在windows上安装服务端客户端" class="anchor" href="#%E5%9C%A8windows%E4%B8%8A%E5%AE%89%E8%A3%85%E6%9C%8D%E5%8A%A1%E7%AB%AF%E5%AE%A2%E6%88%B7%E7%AB%AF" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>在Windows上安装服务端/客户端</h1>
<ul>
<li>安装<a href="https://www.python.org/downloads/windows/">Python</a>
</li>
</ul>
<p><img src="https://cloud.githubusercontent.com/assets/493124/5639371/0b91b9fa-9650-11e4-9782-44526d25f2fa.png" alt=""></p>
<ul>
<li>安装 <a href="https://slproweb.com/products/Win32OpenSSL.html">OpenSSL for Windows</a>
</li>
<li>安装 <a href="http://git-scm.com/download/">git</a> 或 <a href="https://github.com/shadowsocksrr/shadowsocksr">手动下载zip源码包</a>
</li>
</ul>
<h2>
<a id="user-content-获取源代码" class="anchor" href="#%E8%8E%B7%E5%8F%96%E6%BA%90%E4%BB%A3%E7%A0%81" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>获取源代码</h2>
<p><code>git clone -b manyuser https://github.com/shadowsocksrr/shadowsocksr.git</code></p>
<p>执行完毕后会在当前目录新建一个shadowsocksr目录。</p>
<p>进入子目录：</p>
<pre><code>cd shadowsocksr/shadowsocks
</code></pre>
<h4>
<a id="user-content-快捷运行" class="anchor" href="#%E5%BF%AB%E6%8D%B7%E8%BF%90%E8%A1%8C" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>快捷运行</h4>
<pre><code>python server.py -s server_ip -p 443 -k password -m aes-256-cfb -o http_simple

#说明：-p 端口 -k 密码  -m 加密方式 -o 混淆插件
</code></pre>
<p>用 -h 查看所有参数。</p>
<h4>
<a id="user-content-通过配置文件运行" class="anchor" href="#%E9%80%9A%E8%BF%87%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E8%BF%90%E8%A1%8C" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>通过配置文件运行</h4>
<p>建立配置文件 <code>shadowsocks.json</code></p>
<p>写入以下内容：</p>
<div class="highlight highlight-source-js"><pre>{
    <span class="pl-s"><span class="pl-pds">"</span>server<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>0.0.0.0<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>server_ipv6<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>::<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>server_port<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">8388</span>,
    <span class="pl-s"><span class="pl-pds">"</span>local_address<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>127.0.0.1<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>local_port<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">1080</span>,
    <span class="pl-s"><span class="pl-pds">"</span>password<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>mypassword<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>timeout<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">300</span>,
    <span class="pl-s"><span class="pl-pds">"</span>method<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>aes-256-cfb<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>obfs<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>http_simple<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>fast_open<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">false</span>,
    <span class="pl-s"><span class="pl-pds">"</span>workers<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">1</span>
}</pre></div>
<p>一般情况下，只需要修改以下三项即可：</p>
<pre><code>"server_port":8388,        //端口
"password":"password",     //密码
"method":"aes-256-cfb",    //加密方式
</code></pre>
<p>运行（请自行替换shadowsocks.json文件路径）:</p>
<pre><code>python server.py -c shadowsocks.json
</code></pre>
<p>或直接修改根目录下的 config.json 文件，然后运行：</p>
<pre><code>python server.py
</code></pre>
<h2>
<a id="user-content-客户端python版" class="anchor" href="#%E5%AE%A2%E6%88%B7%E7%AB%AFpython%E7%89%88" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>客户端(python版)</h2>
<pre><code>python local.py -s server_ip -p 443 -k password -m aes-256-cfb -o http_simple

#说明：-p 端口 -k 密码  -m 加密方式 -o 混淆插件
</code></pre>
<p>用 -h 查看所有参数。</p>
<h4>
<a id="user-content-通过配置文件运行-1" class="anchor" href="#%E9%80%9A%E8%BF%87%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6%E8%BF%90%E8%A1%8C-1" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>通过配置文件运行</h4>
<p>建立配置文件 <code>shadowsocks.json</code></p>
<p>写入以下内容：</p>
<div class="highlight highlight-source-js"><pre>{
    <span class="pl-s"><span class="pl-pds">"</span>server<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>0.0.0.0<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>server_ipv6<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>::<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>server_port<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">8388</span>,
    <span class="pl-s"><span class="pl-pds">"</span>local_address<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-s"><span class="pl-pds">"</span>127.0.0.1<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>local_port<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">1080</span>,
    <span class="pl-s"><span class="pl-pds">"</span>password<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>mypassword<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>timeout<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-c1">300</span>,
    <span class="pl-s"><span class="pl-pds">"</span>method<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>aes-256-cfb<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>obfs<span class="pl-pds">"</span></span><span class="pl-k">:</span><span class="pl-s"><span class="pl-pds">"</span>http_simple<span class="pl-pds">"</span></span>,
    <span class="pl-s"><span class="pl-pds">"</span>fast_open<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">false</span>,
    <span class="pl-s"><span class="pl-pds">"</span>workers<span class="pl-pds">"</span></span><span class="pl-k">:</span> <span class="pl-c1">1</span>
}</pre></div>
<p>一般情况下，只需要修改以下四项即可：</p>
<pre><code>"server":"0.0.0.0",        //服务器地址
"server_port":8388,        //端口
"password":"password",     //密码
"method":"aes-256-cfb",    //加密方式
</code></pre>
<p>运行（请自行替换shadowsocks.json文件路径）:</p>
<pre><code>python local.py -c shadowsocks.json
</code></pre>
<p>或直接修改根目录下的 config.json 文件，然后运行：</p>
<pre><code>python local.py
</code></pre>
