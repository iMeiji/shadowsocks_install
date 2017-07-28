<h2>原始数据格式</h2>
<pre><code>ssr://XXXXXX
ssr://YYYYYY
</code></pre>
<p>每个节点一行，可任意多行</p>
<p>如果希望客户端只（随机）获取其中n个显示，那么在最前面补上一行<code>MAX=n</code></p>
<p><strong>注意：这些节点必须填写Group字段，且必须都使用相同的Group</strong></p>
<h2>
<a id="user-content-对原始数据的处理" class="anchor" href="#%E5%AF%B9%E5%8E%9F%E5%A7%8B%E6%95%B0%E6%8D%AE%E7%9A%84%E5%A4%84%E7%90%86" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>对原始数据的处理</h2>
<p>假如原始数据是d，然后对d进行base64编码（末尾的等于号保留），作为最终的结果返回</p>
<h2>
<a id="user-content-web接口" class="anchor" href="#web%E6%8E%A5%E5%8F%A3" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>Web接口</h2>
<p>提供一个URL，客户端访问后，返回上文的结果即可，支持http/https。</p>
<p>Web接口实现建议：</p>
<ul>
<li>URL中添加token相关的认证字段（除非打算作为公共订阅）</li>
<li>支持max字段让客户端指定返回的最大条目数量，这时应该随机返回指定数量的节点</li>
</ul>
<h2>
<a id="user-content-客户端约定" class="anchor" href="#%E5%AE%A2%E6%88%B7%E7%AB%AF%E7%BA%A6%E5%AE%9A" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewbox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>客户端约定</h2>
<ul>
<li>URL中使用max字段参数指定返回的最大条目数量</li>
<li>如指定了最大数量，但服务端返回了多于这个数量的条数时，应随机丢掉多余的</li>
</ul>