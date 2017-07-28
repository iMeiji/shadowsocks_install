<h1></a>基本定义</h1>
<p>定义base64为<strong>URL safe base64，且不带padding（没有末尾的等于号）</strong>，具体格式如下：</p>
<p><code>ssr://base64(host:port:protocol:method:obfs:base64pass/?obfsparam=base64param&amp;protoparam=base64param&amp;remarks=base64remarks&amp;group=base64group&amp;udpport=0&amp;uot=0)</code></p>
<p>其中，base64pass及之前以':'分隔的，不可省略，而'/?'及其后面的内容，可按需要写上。<br>
字符串使用UTF8编码，编码后必须以urlsafebase64编码，包括密码、混淆参数、协议参数、备注、group</p>
<p>udpport参数及uot目前仅C#客户端支持</p>
<p>示例：</p>
<pre><code>服务器IP： 127.0.0.1
端口： 1234
密码： aaabbb
加密： aes-128-cfb
协议： auth_aes128_md5
协议参数： （空）
混淆： tls1.2_ticket_auth
混淆参数： breakwa11.moe
备注： 测试中文
</code></pre>
<p>生成的带备注结果：<br>
<code>ssr://MTI3LjAuMC4xOjEyMzQ6YXV0aF9hZXMxMjhfbWQ1OmFlcy0xMjgtY2ZiOnRsczEuMl90aWNrZXRfYXV0aDpZV0ZoWW1KaS8_b2Jmc3BhcmFtPVluSmxZV3QzWVRFeExtMXZaUSZyZW1hcmtzPTVyV0w2Sy1WNUxpdDVwYUg</code></p>
<p>生成的不带备注的标准结果（结果唯一）：<br>
<code>ssr://MTI3LjAuMC4xOjEyMzQ6YXV0aF9hZXMxMjhfbWQ1OmFlcy0xMjgtY2ZiOnRsczEuMl90aWNrZXRfYXV0aDpZV0ZoWW1KaS8_b2Jmc3BhcmFtPVluSmxZV3QzWVRFeExtMXZaUQ</code></p>
<p>如果你生成的不带备注的结果结果与上面的不一致，那么请检查实现代码，否则可能导致部分环境下识别错误。</p>
<h1>
<a id="user-content-多链接组合" class="anchor" href="#%E5%A4%9A%E9%93%BE%E6%8E%A5%E7%BB%84%E5%90%88" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>多链接组合</h1>
<p>用于同时导入或导出多个链接使用</p>
<p>标准导出格式形如：</p>
<pre><code>ssr://aaa
ssr://bbb
ssr://ccc
</code></pre>
<p>或者</p>
<pre><code>ssr://aaa ssr://bbb ssr://ccc
</code></pre>
<p>即使用换行分隔或空格分隔，注意换行可能因平台不同而产生三种不同的换行格式</p>
<p>其它格式例如使用"|"作为分隔符，尽管多数客户端仍然能识别，但也不建议使用此格式，请不要以客户端能识别作为判断标准。</p>