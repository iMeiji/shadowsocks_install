 <h1>ShadowsocksR 服务端安装教程</h1>
<h3>
<a id="user-content-说明" class="anchor" href="#%E8%AF%B4%E6%98%8E" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>说明</h3>
<p>不建议使用一键脚本安装，除非你自己能维护其功能，否则安装时若出了问题很难查，而且现在有不少不明来历的一键脚本内嵌后门程序。<br>
此教程为单用户版，适合个人用户。如果你是站长，请查看多用户版教程：<br>
<a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/Server-Setup(manyuser-with-mysql)">数据库多用户教程</a><br>
<a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/Server-Setup(manyuser-with-mudbjson)">json版多用户教程</a>（仅一台服务器适用）</p>
<h2>
<a id="user-content-基本库安装" class="anchor" href="#%E5%9F%BA%E6%9C%AC%E5%BA%93%E5%AE%89%E8%A3%85" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>基本库安装</h2>
<p>以下命令均以root用户执行，或sudo方式执行</p>
<p>centos：</p>
<pre><code>yum install git
</code></pre>
<p>ubuntu/debian：</p>
<pre><code>apt-get install git
</code></pre>
<h2>
<a id="user-content-获取源代码" class="anchor" href="#%E8%8E%B7%E5%8F%96%E6%BA%90%E4%BB%A3%E7%A0%81" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>获取源代码</h2>
<p><code>git clone -b manyuser https://github.com/shadowsocksr/shadowsocksr.git</code></p>
<p>执行完毕后此目录会新建一个shadowsocksr目录，其中根目录的是多用户版（即数据库版，个人用户请忽略这个），子目录中的是单用户版(即shadowsocksr/shadowsocks)。</p>
<p>根目录即 ./shadowsocksr</p>
<p>子目录即 ./shadowsocksr/shadowsocks</p>
<h2>
<a id="user-content-服务端配置" class="anchor" href="#%E6%9C%8D%E5%8A%A1%E7%AB%AF%E9%85%8D%E7%BD%AE" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>服务端配置</h2>
<p>进入根目录初始化配置(假设根目录在<code>~/shadowsocksr</code>，如果不是，命令需要适当调整)：</p>
<pre><code>cd ~/shadowsocksr
bash initcfg.sh
</code></pre>
<p>以下步骤要进入子目录：</p>
<pre><code>cd ~/shadowsocksr/shadowsocks
</code></pre>
<p>####快速运行####</p>
<pre><code>python server.py -p 443 -k password -m aes-256-cfb -O auth_sha1_v4 -o http_simple

#说明：-p 端口 -k 密码  -m 加密方式 -O 协议插件 -o 混淆插件
</code></pre>
<p>如果要后台运行：</p>
<pre><code>python server.py -p 443 -k password -m aes-256-cfb -O auth_sha1_v4 -o http_simple -d start
</code></pre>
<p>如果要停止/重启：</p>
<pre><code>python server.py -d stop/restart
</code></pre>
<p>查看日志：</p>
<pre><code>tail -f /var/log/shadowsocksr.log
</code></pre>
<p>用 -h 查看所有参数</p>
<p>#### 使用配置文件运行 ####</p>
<p>如果你的ss目录是<code>~/shadowsocksr</code>，进入这里<br>
修改<code>user-config.json</code>中的<code>server_port</code>，<code>password</code>等字段，具体可参见：<br>
<a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/config.json">https://github.com/Ssrbackup/shadowsocks-rss/wiki/config.json</a></p>
<p>运行子目录内的server.py：</p>
<pre><code>python server.py
</code></pre>
<p>如果要在后台运行：</p>
<pre><code>python server.py -d start
</code></pre>
<p>如果要停止/重启：</p>
<pre><code>python server.py -d stop/restart
</code></pre>
<p>查看日志：</p>
<pre><code>tail -f /var/log/shadowsocksr.log
</code></pre>
<h3>
<a id="user-content-更新源代码" class="anchor" href="#%E6%9B%B4%E6%96%B0%E6%BA%90%E4%BB%A3%E7%A0%81" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>更新源代码</h3>
<p>如果代码有更新可用本命令更新代码</p>
<p>进入shadowsocksr目录<br>
<code>cd shadowsocksr</code><br>
执行<br>
<code>git pull</code><br>
成功后重启ssr服务</p>
<h3>
<a id="user-content-自启动" class="anchor" href="#%E8%87%AA%E5%90%AF%E5%8A%A8" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>自启动</h3>
<p><a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/System-startup-script">System startup script</a></p>
<h2>
<a id="user-content-客户端" class="anchor" href="#%E5%AE%A2%E6%88%B7%E7%AB%AF" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>客户端</h2>
<p>注：以下客户端中有：
windows客户端和python版客户端，ShadowsocksX-NG（macOS客户端之一），
Android客户端，Shadowrocket（iOS客户端之一，iTunes售价$3美元/￥18人民币），
可以使用SSR特性，</p>
<p>其他原版客户端只能以兼容的方式连接SSR服务器（SSR可兼容SS客户端）。</p>
<ul>
<li>
<a href="https://github.com/shadowsocksrr/shadowsocksr-csharp">Windows</a> / <a href="https://github.com/shadowsocks/shadowsocks-iOS/wiki/Shadowsocks-for-OSX-Help">OS X</a> / <a href="https://github.com/yichengchen/ShadowsocksX-R">ShadowsocksX-NG</a>
</li>
<li>
<a href="https://github.com/shadowsocksrr/shadowsocksr">Linux python</a> / <a href="https://github.com/librehat/shadowsocks-qt5">Linux Qt</a>
</li>
<li>
<a href="https://github.com/shadowsocksrr/shadowsocksr-android">Android</a> / <a href="https://github.com/shadowsocks/shadowsocks-iOS/wiki/Help">iOS</a> / <a href="https://itunes.apple.com/us/app/shadowrocket/id932747118">Shadowrocket</a>
</li>
<li><a href="https://github.com/shadowsocks/openwrt-shadowsocks">OpenWRT</a></li>
</ul>
<p>OSX上可使用GoAgentX的SSR插件。在你本地的 PC 或手机上使用图形客户端。具体使用参见它们的使用说明。</p>
<p>也可以直接使用 <a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/Python-client-setup-(Mult-language)">Python</a> 版客户端（命令行）。</p>
<h3>
<a id="user-content-其它加密支持" class="anchor" href="#%E5%85%B6%E5%AE%83%E5%8A%A0%E5%AF%86%E6%94%AF%E6%8C%81" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>其它加密支持</h3>
<p>安装<a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/libsodium">libsodium</a>即可支持 salsa20, chacha20, chacha20-ietf 加密（暂不支持<a href="https://github.com/onelogin/aead">AEAD</a>）</p>
<h3>
<a id="user-content-其它异常" class="anchor" href="#%E5%85%B6%E5%AE%83%E5%BC%82%E5%B8%B8" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>其它异常</h3>
<p>如果你的服务端python版本在2.6以下，那么必须更新python到2.6.x或2.7.x版本</p>
<p>其它参见 <a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/ulimit">https://github.com/Ssrbackup/shadowsocks-rss/wiki/ulimit</a></p>
