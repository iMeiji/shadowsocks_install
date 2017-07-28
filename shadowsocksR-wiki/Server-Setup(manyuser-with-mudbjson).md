   <h1>
<a id="user-content-shadowsocksr-多用户版安装教程" class="anchor" href="#shadowsocksr-%E5%A4%9A%E7%94%A8%E6%88%B7%E7%89%88%E5%AE%89%E8%A3%85%E6%95%99%E7%A8%8B" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>ShadowsocksR 多用户版安装教程</h1>
<p>以下命令均以root用户执行，或sudo方式执行</p>
<h3>
<a id="user-content-基本库安装" class="anchor" href="#%E5%9F%BA%E6%9C%AC%E5%BA%93%E5%AE%89%E8%A3%85" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>基本库安装</h3>
<p>centos：</p>
<pre><code>yum install python-setuptools &amp;&amp; easy_install pip
yum install git
</code></pre>
<p>ubuntu/debian：</p>
<pre><code>apt-get install python-pip
apt-get install git
</code></pre>
<h3>
<a id="user-content-获取源代码" class="anchor" href="#%E8%8E%B7%E5%8F%96%E6%BA%90%E4%BB%A3%E7%A0%81" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>获取源代码</h3>
<p><code>git clone -b manyuser https://github.com/shadowsocksrr/shadowsocksr.git</code></p>
<p>执行完毕后此目录会新建一个shadowsocks目录，其中根目录的是多用户版（即数据库版），子目录中的是单用户版。</p>
<p>根目录即 ./shadowsocksr</p>
<p>子目录即 ./shadowsocksr/shadowsocks</p>
<h3>
<a id="user-content-服务端配置" class="anchor" href="#%E6%9C%8D%E5%8A%A1%E7%AB%AF%E9%85%8D%E7%BD%AE" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>服务端配置</h3>
<p>进入根目录初始化配置(假设根目录在<code>~/shadowsocksr</code>，如果不是，命令需要适当调整)：</p>
<pre><code>cd ~/shadowsocksr
bash initcfg.sh
</code></pre>
<p>shadowsocksr目录内，对<code>userapiconfig.py</code>里以下内容进行相应修改：</p>
<pre><code>API_INTERFACE = 'mudbjson' #修改接口类型

SERVER_PUB_ADDR = '127.0.0.1' #修改生成链接对应的公网IP
</code></pre>
<p>接着，通过使用脚本<code>mujson_mgr.py</code>添加端口及相应的加密、协议、混淆等配置，具体方法通过执行以下命令查看该脚本的说明及提示：<br>
<code>python mujson_mgr.py</code></p>
<h3>
<a id="user-content-服务端运行与停止" class="anchor" href="#%E6%9C%8D%E5%8A%A1%E7%AB%AF%E8%BF%90%E8%A1%8C%E4%B8%8E%E5%81%9C%E6%AD%A2" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>服务端运行与停止</h3>
<p>后台运行（无log，ssh窗口关闭后也继续运行）</p>
<p><code>./run.sh</code></p>
<p>后台运行（输出log，ssh窗口关闭后也继续运行）</p>
<p><code>./logrun.sh</code></p>
<p>后台运行时查看运行情况</p>
<p><code>./tail.sh</code></p>
<p>停止运行</p>
<p><code>./stop.sh</code></p>
<p>注：通过脚本运行默认日志会保存在根目录的ssserver.log，可手动查看。</p>
<h3>
<a id="user-content-更新源代码" class="anchor" href="#%E6%9B%B4%E6%96%B0%E6%BA%90%E4%BB%A3%E7%A0%81" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>更新源代码</h3>
<p>如果代码有更新可用本命令更新代码</p>
<p>进入shadowsocksr目录</p>
<p><code>cd shadowsocksr</code></p>
<p>执行</p>
<p><code>git pull</code></p>
<p>成功后重启ssr服务</p>
<h3>
<a id="user-content-其它异常" class="anchor" href="#%E5%85%B6%E5%AE%83%E5%BC%82%E5%B8%B8" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>其它异常</h3>
<p>如果你的服务端python版本在2.6以下，那么必须更新python到2.6.x或2.7.x版本</p>
<p>其它参见 <a href="https://github.com/Ssrbackup/shadowsocks-rss/wiki/ulimit">https://github.com/Ssrbackup/shadowsocks-rss/wiki/ulimit</a></p>