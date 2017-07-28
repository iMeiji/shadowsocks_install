  <div id="readme" class="readme blob instapaper_body">
    <article class="markdown-body entry-content" itemprop="text"><h1><a id="user-content-shadowsocksr-协议插件文档" class="anchor" href="#shadowsocksr-协议插件文档" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>ShadowsocksR 协议插件文档</h1>
<hr>
<h2><a id="user-content-概要" class="anchor" href="#概要" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>概要</h2>
<p>用于方便地产生各种协议接口。实现为在原来的协议外套一层编码和解码接口，不但可以伪装成其它协议流量，还可以把原协议转换为其它协议进行兼容或完善（但目前接口功能还没有写完，目前还在测试完善中），需要服务端与客户端配置相同的协议插件。插件共分为两类，包括混淆插件和协议定义插件。</p>
<h2><a id="user-content-现有插件介绍" class="anchor" href="#现有插件介绍" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>现有插件介绍</h2>
<h4><a id="user-content-1混淆插件" class="anchor" href="#1混淆插件" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>1.混淆插件</h4>
<p>此类型的插件用于定义加密后的通信协议，通常用于协议伪装，部分插件能兼容原协议。</p>
<p><code>plain</code>：表示不混淆，直接使用协议加密后的结果发送数据包</p>
<p><code>http_simple</code>：并非完全按照http1.1标准实现，仅仅做了一个头部的GET请求和一个简单的回应，之后依然为原协议流。使用这个混淆后，已在部分地区观察到似乎欺骗了QoS的结果。对于这种混淆，它并非为了减少特征，相反的是提供一种强特征，试图欺骗GFW的协议检测。要注意的是应用范围变大以后因特征明显有可能会被封锁。此插件可以兼容原协议(需要在服务端配置为<code>http_simple_compatible</code>)，延迟与原协议几乎无异（在存在QoS的地区甚至可能更快），除了头部数据包外没有冗余数据包，客户端支持自定义参数，参数为http请求的host，例如设置为<code>cloudfront.com</code>伪装为云服务器请求，可以使用逗号分割多个host如<code>a.com,b.net,c.org</code>，这时会随机使用。注意，错误设置此参数可能导致连接被断开甚至IP被封锁，如不清楚如何设置那么请留空。服务端也支持自定义参数，意义为客户端仅能填写的参数列表，以逗号分割。<br>
本插件的高级设置（C#版、python版及ssr-libev版均支持）：本插件可以自定义几乎完整的http header，其中前两行的GET和host不能修改，可自定义从第三行开始的内容。例子：<br>
<code>baidu.com#User-Agent: abc\nAccept: text/html\nConnection: keep-alive</code><br>
这是填于混淆参数的内容，在#号前面的是上文所说的host，后面即为自定义header，所有的换行使用\n表示（写于配置文件时也可直接使用\n而不必写成\n，换行符亦会转换），如遇到需要使用单独的\号，可写为<code>\\</code>，最末尾不需要写\n，程序会自动加入连续的两个换行。</p>
<p><code>http_post</code>：与<code>http_simple</code>绝大部分相同，区别是使用POST方式发送数据，符合http规范，欺骗性更好，但只有POST请求这种行为容易被统计分析出异常。此插件可以兼容<code>http_simple</code>，同时也可兼容原协议(需要在服务端配置为<code>http_post_compatible</code>)，参数设置等内容参见<code>http_simple</code>，密切注意如果使用自定义http header，请务必填写boundary。</p>
<p><code>random_head</code>（不建议使用）：开始通讯前发送一个几乎为随机的数据包（目前末尾4字节为CRC32，会成为特征，以后会有改进版本），之后为原协议流。目标是让首个数据包根本不存在任何有效信息，让统计学习机制见鬼去吧。此插件可以兼容原协议(需要在服务端配置为<code>random_head_compatible</code>)，比原协议多一次握手导致连接时间会长一些，除了握手过程之后没有冗余数据包，不支持自定义参数。</p>
<p><code>tls1.2_ticket_auth</code>（强烈推荐）:模拟TLS1.2在客户端有session ticket的情况下的握手连接。目前为完整模拟实现，经抓包软件测试完美伪装为TLS1.2。因为有ticket所以没有发送证书等复杂步骤，因而防火墙无法根据证书做判断。同时自带一定的抗重放攻击的能力，以及包长度混淆能力。如遇到重放攻击则会在服务端log里搜索到，可以通过<code>grep "replay attack"</code>搜索，可以用此插件发现你所在地区线路有没有针对TLS的干扰。防火墙对TLS比较无能为力，抗封锁能力应该会较其它插件强，但遇到的干扰也可能不少，不过协议本身会检查出任何干扰，遇到干扰便断开连接，避免长时间等待，让客户端或浏览器自行重连。此插件可以兼容原协议(需要在服务端配置为<code>tls1.2_ticket_auth_compatible</code>)，比原协议多一次握手导致连接时间会长一些，使用C#客户端开启自动重连时比其它插件表现更好。客户端<strong>支持自定义参数，参数为SNI，即发送host名称的字段</strong>，此功能与TOR的meek插件十分相似，例如设置为<code>cloudfront.net</code>伪装为云服务器请求，可以使用逗号分割多个host如<code>a.com,b.net,c.org</code>，这时会随机使用。注意，错误设置此参数可能导致连接被断开甚至IP被封锁，如不清楚如何设置那么请留空。推荐自定义参数设置为<code>cloudflare.com</code>或<code>cloudfront.net</code>。服务端暂不支持自定义参数。</p>
<h4><a id="user-content-2协议定义插件" class="anchor" href="#2协议定义插件" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>2.协议定义插件</h4>
<p>此类型的插件用于定义加密前的协议，通常用于长度混淆及增强安全性和隐蔽性，部分插件能兼容原协议。</p>
<p><code>origin</code>：表示使用原始SS协议，此配置速度最快效率最高，适用于限制少或审查宽松的环境。否则不建议使用。</p>
<p><code>verify_deflate</code>（不建议）：对每一个包都进行deflate压缩，数据格式为：包长度(2字节)|压缩数据流|原数据流Adler-32，此格式省略了0x78,0x9C两字节的头部。另外，对于已经压缩过或加密过的数据将难以压缩（可能增加1~20字节），而对于未加密的html文本会有不错的压缩效果。因为压缩及解压缩较占CPU，不建议较多用户同时使用此混淆插件。此插件<strong>不能兼容原协议</strong>，千万不要添加<code>_compatible</code>的后缀。</p>
<p><code>verify_sha1</code>（即原版OTA协议，已废弃）：对每一个包都进行SHA-1校验，具体协议描述参阅<a href="https://shadowsocks.org/en/spec/one-time-auth.html">One Time Auth</a>，握手数据包增加10字节，其它数据包增加12字节。此插件能兼容原协议（需要在服务端配置为<code>verify_sha1_compatible</code>)。</p>
<p><code>auth_sha1</code>（已废弃）：对首个包进行SHA-1校验，同时会发送由客户端生成的随机客户端id(4byte)、连接id(4byte)、unix时间戳(4byte)，之后的通讯使用Adler-32作为效验码。此插件提供了能抵抗一般的重放攻击的认证，默认同一端口最多支持64个客户端同时使用，可通过修改此值限制客户端数量，使用此插件的服务器与客户机的UTC时间差不能超过1小时，通常只需要客户机校对本地时间并正确设置时区就可以了。此插件与原协议握手延迟相同，能兼容原协议（需要在服务端配置为<code>auth_sha1_compatible</code>)，支持服务端自定义参数，参数为10进制整数，表示最大客户端同时使用数。</p>
<p><code>auth_sha1_v2</code>（已废弃）：与<code>auth_sha1</code>相似，去除时间验证，以避免部分设备由于时间导致无法连接的问题，增长客户端ID为8字节，使用较大的长度混淆。能兼容原协议（需要在服务端配置为<code>auth_sha1_v2_compatible</code>)，支持服务端自定义参数，参数为10进制整数，表示最大客户端同时使用数。</p>
<p><code>auth_sha1_v4</code>（不建议）：与<code>auth_sha1</code>对首个包进行SHA-1校验，同时会发送由客户端生成的随机客户端id(4byte)、连接id(4byte)、unix时间戳(4byte)，之后的通讯使用Adler-32作为效验码，对包长度单独校验，以抵抗抓包重放检测，使用较大的长度混淆，使用此插件的服务器与客户机的UTC时间差不能超过24小时，即只需要年份日期正确即可。能兼容原协议（需要在服务端配置为<code>auth_sha1_v4_compatible</code>)，支持服务端自定义参数，参数为10进制整数，表示最大客户端同时使用数。</p>
<p><code>auth_aes128_md5</code>或<code>auth_aes128_sha1</code>（均推荐）：对首个包的认证部分进行使用Encrypt-then-MAC模式以真正免疫认证包的CCA攻击，预防各种探测和重防攻击，同时此协议支持单端口多用户，具体设置方法参见breakwa11的博客。使用此插件的服务器与客户机的UTC时间差不能超过24小时，即只需要年份日期正确即可，针对UDP部分也有做简单的校验。此插件<strong>不能兼容原协议</strong>，支持服务端自定义参数，参数为10进制整数，表示最大客户端同时使用数。</p>
<p><code>auth_chain_a</code>（强烈推荐）：对首个包的认证部分进行使用Encrypt-then-MAC模式以真正免疫认证包的CCA攻击，预防各种探测和重防攻击，数据流自带RC4加密，同时此协议支持单端口多用户，不同用户之间无法解密数据，每次加密密钥均不相同，具体设置方法参见breakwa11的博客。使用此插件的服务器与客户机的UTC时间差不能超过24小时，即只需要年份日期正确即可，针对UDP部分也有加密及长度混淆。使用此插件建议加密使用none。此插件<strong>不能兼容原协议</strong>，支持服务端自定义参数，参数为10进制整数，表示最大客户端同时使用数，最小值支持直接设置为1，此插件能实时响应实际的客户端数量（你的客户端至少有一个连接没有断开才能保证你占用了一个客户端数，否则设置为1时其它客户端一连接别的就一定连不上）。</p>
<p>推荐使用<code>auth_chain_a</code>插件，在以上插件里混淆能力较高，而抗检测能力最高，即使多人使用也难以识别封锁。同时如果要发布公开代理，以上auth插件均可严格限制使用客户端数（要注意的是若为<code>auth_sha1_v4_compatible</code>，那么用户只要使用原协议就没有限制效果），而<code>auth_chain_a</code>协议的限制最为精确。</p>
<h2><a id="user-content-混淆特性" class="anchor" href="#混淆特性" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>混淆特性</h2>
<table>
<thead>
<tr>
<th>name</th>
<th align="center">RTT</th>
<th align="right">encode speed</th>
<th align="center">bandwidth</th>
<th align="center">anti replay attack</th>
<th align="center">cheat QoS</th>
<th align="right">anti analysis</th>
</tr>
</thead>
<tbody>
<tr>
<td>plain</td>
<td align="center">0</td>
<td align="right">100%</td>
<td align="center">100%</td>
<td align="center">No</td>
<td align="center">0</td>
<td align="right">/</td>
</tr>
<tr>
<td>http_simple</td>
<td align="center">0</td>
<td align="right">20%/100%</td>
<td align="center">20%/100%</td>
<td align="center">No</td>
<td align="center">90</td>
<td align="right">70</td>
</tr>
<tr>
<td>http_post</td>
<td align="center">0</td>
<td align="right">20%/100%</td>
<td align="center">20%/100%</td>
<td align="center">No</td>
<td align="center">100</td>
<td align="right">70</td>
</tr>
<tr>
<td>random_head (X)</td>
<td align="center">1</td>
<td align="right">100%</td>
<td align="center">85%/100%</td>
<td align="center">No</td>
<td align="center">0</td>
<td align="right">10</td>
</tr>
<tr>
<td>tls1.2_ticket_auth</td>
<td align="center">1</td>
<td align="right">98%</td>
<td align="center">75%/ 95%</td>
<td align="center">Yes</td>
<td align="center">100</td>
<td align="right">90</td>
</tr></tbody></table>
<p>说明：</p>
<ul>
<li>20%/100%表示首包为20%，其余为100%速度（或带宽），其它的 RTT 大于0的混淆，前面的表示在浏览普通网页的情况下平均有效利用带宽的估计值，后一个表示去除握手响应以后的值，适用于大文件下载时。</li>
<li>RTT 表示此混淆是否会产生附加的延迟，1个RTT表示通讯数据一次来回所需要的时间。</li>
<li>RTT 不为0且没有 anti replay attack 能力的混淆，不论协议是什么，都存在<strong>被主动探测的风险</strong>，即不建议使用<code>random_head</code>。 RTT 为0的，只要协议不是 origin，就没有被主动探测的风险。当然由于原协议本身也存在被主动探测的风险，在目前没有观察到主动探测行为的情况下，暂时不需要太担心。</li>
<li>cheat QoS 表示欺骗路由器 QoS 的能力，100表示能完美欺骗，0表示没有任何作用，50分左右表示较为严格的路由能识别出来。</li>
<li>anti analysis 表示抗协议分析能力，plain 的时候依赖于协议，其它的基于网友反馈而给出的分值。值为100表示完美伪装。</li>
</ul>
<h2><a id="user-content-协议特性" class="anchor" href="#协议特性" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>协议特性</h2>
<p>假设 method = "aes-256-cfb"<br>
以下所有协议与均 anti CPA</p>
<table>
<thead>
<tr>
<th>name</th>
<th align="center">RTT</th>
<th align="right">encode speed</th>
<th align="center">bandwidth</th>
<th align="center">anti CCA</th>
<th align="center">anti replay attack</th>
<th align="center">anti MITM detect</th>
<th align="center">anti packet length analysis</th>
</tr>
</thead>
<tbody>
<tr>
<td>origin</td>
<td align="center">0</td>
<td align="right">100%</td>
<td align="center">99%</td>
<td align="center">No</td>
<td align="center">No</td>
<td align="center">No</td>
<td align="center">0</td>
</tr>
<tr>
<td>verify_deflate</td>
<td align="center">0</td>
<td align="right">30%</td>
<td align="center">97%~110%</td>
<td align="center">No</td>
<td align="center">No</td>
<td align="center">No</td>
<td align="center">6</td>
</tr>
<tr>
<td>verify_sha1 (X)</td>
<td align="center">0</td>
<td align="right">85%</td>
<td align="center">98%/99%</td>
<td align="center">No</td>
<td align="center">No</td>
<td align="center">No</td>
<td align="center">0</td>
</tr>
<tr>
<td>auth_sha1 (X)</td>
<td align="center">0</td>
<td align="right">95%</td>
<td align="center">97%</td>
<td align="center">No</td>
<td align="center">Yes</td>
<td align="center">No</td>
<td align="center">4</td>
</tr>
<tr>
<td>auth_sha1_v2 (X)</td>
<td align="center">0</td>
<td align="right">94%</td>
<td align="center">80%/97%</td>
<td align="center">No</td>
<td align="center">Yes</td>
<td align="center">No</td>
<td align="center">10</td>
</tr>
<tr>
<td>auth_sha1_v4</td>
<td align="center">0</td>
<td align="right">90%</td>
<td align="center">85%/98%</td>
<td align="center">No</td>
<td align="center">Yes</td>
<td align="center">No</td>
<td align="center">10</td>
</tr>
<tr>
<td>auth_aes128_md5</td>
<td align="center">0</td>
<td align="right">80%</td>
<td align="center">70%/98%</td>
<td align="center">Yes</td>
<td align="center">Yes</td>
<td align="center">Yes</td>
<td align="center">10</td>
</tr>
<tr>
<td>auth_aes128_sha1</td>
<td align="center">0</td>
<td align="right">70%</td>
<td align="center">70%/98%</td>
<td align="center">Yes</td>
<td align="center">Yes</td>
<td align="center">Yes</td>
<td align="center">10</td>
</tr>
<tr>
<td>auth_chain_a</td>
<td align="center">0</td>
<td align="right">70%</td>
<td align="center">75%/98%</td>
<td align="center">Yes</td>
<td align="center">Yes</td>
<td align="center">Yes</td>
<td align="center">15</td>
</tr></tbody></table>
<p>说明：</p>
<ul>
<li>以上为浏览普通网页（非下载非看视频）的平均测试结果，浏览不同的网页会有不同的偏差</li>
<li>encode speed仅用于提供相对速度的参考，不同环境下代码执行速度不同</li>
<li>verify_deflate的bandwidth（有效带宽）上限110%仅为估值，若数据经过压缩或加密，那么压缩效果会很差</li>
<li>verify_sha1的bandwidth意为上传平均有效带宽98%，下载99%</li>
<li>auth_aes128_md5的bandwidth在浏览普通网页时较低（为了较强的长度混淆，但单个数据包尺寸会保持在 TCP MSS 以内，所以其实对网速影响很小），而看视频或下载时有效数据比率比auth_sha1要高，可达97%，所以不用担心下载时的速度。auth_chain_a及auth_aes128_md5类似</li>
<li>如果同时使用了其它的混淆插件，会令bandwidth的值降低，具体由所使用的混淆插件及所浏览的网页共同决定</li>
<li>对于抗包长度分析一列，满分为100，即0为完全无效果，5以下为效果轻微，具体分析方法可参阅方校长等人论文</li>
<li>对于抗包时序分析一列，方校长的论文表示虽然可利用，但利用难度大（也即他们还没能达到实用级），目前对此也不做处理</li>
</ul>
<h2><a id="user-content-混淆与协议配置建议" class="anchor" href="#混淆与协议配置建议" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>混淆与协议配置建议</h2>
<ul>
<li>协议推荐：协议用<code>auth_chain_a</code>最佳，此时推荐不使用加密（设置为none），混淆随意</li>
<li>加密选择：若协议用<code>auth_chain_a</code>，那加密用none（但不代表密码可以不写或两边不匹配），若协议不是<code>auth_aes128_md5</code>或<code>auth_aes128_sha1</code>，那么不能使用rc4加密（可用rc4-md5）。这时加密可以在rc4-md5、salsa20、chacha20-ietf三个里面选择（rc4-md5可换为aes系列，salsa20可换为chacha20或bf-cfb），如果使用SSR还可特别选择rc4-md5-6。</li>
<li>混淆推荐：如果QoS在你的地区明显，混淆建议在<code>http_simple</code>与<code>tls1.2_ticket_auth</code>中选择，具体选择可以通过自己的试验得出。如果选择混淆后反而变慢，那么混淆请选择<code>plain</code>。如果你不在乎QoS，但担心你的个人vps能不能持久使用，那么混淆选择<code>plain</code>或<code>tls1.2_ticket_auth</code>，协议选择<code>auth_chain_a</code>或<code>auth_aes128_md5</code>或<code>auth_aes128_sha1</code></li>
<li>如果你用于玩游戏，或对连接延迟有要求的情况下，建议不要使用<code>tls1.2_ticket_auth</code>混淆，用其它混淆或<code>plain</code></li>
<li>服务端里，<code>http_simple</code>与<code>http_post</code>是相互兼容的，没有使用上的区别</li>
<li>如果你在公司，或学校，或某些环境下，发现原版SS协议不可用，建议你启用<code>http_simple</code>、<code>http_post</code>或<code>tls1.2_ticket_auth</code>混淆，同时端口相应使用80或443，通常能解决问题。同时能躲避你所在环境下的网络封锁（如禁止访问网盘禁止上传等等）</li>
<li>如果使用<code>tls1.2_ticket_auth</code>混淆或不开启混淆，那么协议最好不要使用<code>origin</code>或<code>verify_sha1</code></li>
<li>如果使用二重代理，一般你只需要考虑越过防火墙的那一段使用混淆或加强协议，除非为了匿名</li>
<li>如果你发现你的代理突然不能用了，但换一个端口又能用了，或者等15分钟到半小时后又能用了，这种情况下请联系我</li>
</ul>
<h2><a id="user-content-配置方法" class="anchor" href="#配置方法" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>配置方法</h2>
<p>服务端配置：使用最新<a href="https://github.com/breakwa11/shadowsocks/tree/manyuser">SSR的manyuser</a>分支<br>
user-config.json或config.json里有一个protocol的字段，目前的可能取值为：<br>
<code>origin</code><br>
<code>verify_deflate</code> （不建议）<br>
<code>verify_sha1</code> （已过时）<br>
<code>verify_sha1_compatible</code> （已过时）<br>
<code>auth_sha1</code> （已过时）<br>
<code>auth_sha1_compatible</code> （已过时）<br>
<code>auth_sha1_v2</code> （已过时）<br>
<code>auth_sha1_v2_compatible</code> （已过时）<br>
<code>auth_sha1_v4</code>  （不建议）<br>
<code>auth_sha1_v4_compatible</code> （不建议）<br>
<code>auth_aes128_md5</code><br>
<code>auth_aes128_sha1</code><br>
<code>auth_chain_a</code></p>
<p>user-config.json或config.json里有一个obfs的字段，目前的可能取值为：<br>
<code>plain</code><br>
<code>http_simple</code><br>
<code>http_simple_compatible</code><br>
<code>http_post</code><br>
<code>http_post_compatible</code><br>
<code>random_head</code> （已过时）<br>
<code>random_head_compatible</code> （已过时）<br>
<code>tls1.2_ticket_auth</code><br>
<code>tls1.2_ticket_auth_compatible</code></p>
<p>默认为<br>
<code>"protocol":"auth_aes128_md5",</code><br>
<code>"obfs":"tls1.2_ticket_auth_compatible",</code><br>
相应的<br>
协议插件参数默认为<code>"protocol_param":""</code><br>
混淆插件参数默认为<code>"obfs_param":""</code><br>
对于protocol，必须服务端与客户端严格匹配<br>
服务端配置为<code>xxabc_compatible</code>时（以compatible为后缀的），即服务端<strong>支持使用原版客户端</strong>，或使用配置插件为<code>xxabc</code>或<code>plain</code>的ssr客户端。</p>
<p>客户端配置：使用本ssr版本，在编辑服务器配置里找到相应节点，最后在protocol选项和obfs选项的列表里选择需要使用的插件，然后填写相应的参数即可</p>
<h4><a id="user-content-兼容性" class="anchor" href="#兼容性" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>兼容性</h4>
<p>目前ssr-libev客户端、ssr-python及ssr-csharp支持全部没有标注为过时或不推荐的协议和混淆。</p>
<h2><a id="user-content-实现接口" class="anchor" href="#实现接口" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>实现接口</h2>
<p>以下以C#语言为例做说明</p>
<p>interface IObfs</p>
<p>成员函数</p>
<p><code>InitData()</code><br>
参数：无<br>
返回：一个自定义类型变量，通常用于保存此接口的全局信息，不应返回null，c语言中返回void*<br>
说明：第一次创建实例前调用，同一服务端配置不会重复调用，服务端在建立监听时调用，客户端在第一次连接时调用。</p>
<p><code>SetServerInfo(ServerInfo serverInfo)</code><br>
参数：ServerInfo结构，包含成员变量：</p>
<ul>
<li>host: 字符串类型，服务端ip，客户端需要把域名转换为ip，如有前置代理，则直接使用配置时所用的域名也可，服务端需要获取监听ip</li>
<li>port: 整数类型，服务端监听端口</li>
<li>param: 用户设置的参数，字符串类型</li>
<li>data: 由InitData返回的结果，为object类型（c语言中使用void*）</li>
<li>iv: 客户端或服务端加密时使用的iv数组（c语言中需要添加额外字段以记录其长度，下同）</li>
<li>recv_iv: 客户端或服务端接收到的iv数组</li>
<li>key: 加密时使用的key（不是原key，是通过BytesToKey生成的指定长度数组）</li>
<li>tcp_mss: 整数类型，TCP分包大小，设置为1460</li>
<li>overhead: 整数类型，协议头部大小，需要由调用方设置</li>
</ul>
<p>返回：无<br>
说明：实例构造的时候（每个连接建立时）调用，调用前iv和key必须已经初始化；而接收到数据后先初始化recv_iv再调用插件。</p>
<p><code>int GetOverhead()</code>
参数：无<br>
返回：此插件在通信时的附加头部大小</p>
<p><code>Dispose()</code><br>
参数：无<br>
返回：无<br>
说明：实例析构时（每个连接关闭时）调用</p>
<p><code>byte[] ClientPreEncrypt(byte[] plaindata, int datalength, out int outlength)</code><br>
参数：需要处理的字节数组及其长度<br>
返回：处理后的字节数组及其长度<br>
说明：客户端发送到服务端数据<strong>加密前</strong>调用此接口</p>
<p><code>byte[] ClientEncode(byte[] encryptdata, int datalength, out int outlength)</code><br>
参数：需要编码的字节数组及其长度<br>
返回：编码后的字节数组及其长度<br>
说明：客户端发送到服务端数据<strong>加密后</strong>调用此接口</p>
<p><code>byte[] ClientDecode(byte[] encryptdata, int datalength, out int outlength, out bool needsendback)</code><br>
参数：需要解码的字节数组及其长度<br>
返回：解码后的字节数组及其长度，以及needsendback标记是否立即回发服务端数据。如needsendback为true，则会立即调用ClientEncode，调用时参数是一个长度为0的字节数组<br>
说明：客户端收到服务端数据在<strong>解密前</strong>调用此接口</p>
<p><code>byte[] ClientPostDecrypt(byte[] plaindata, int datalength, out int outlength)</code><br>
参数：需要处理的字节数组及其长度<br>
返回：处理后的字节数组及其长度<br>
说明：客户端收到服务端数据在<strong>解密后</strong>调用此接口</p>
<p><code>byte[] ServerPreEncrypt(byte[] plaindata, int datalength, out int outlength)</code><br>
参数：需要处理的字节数组及其长度<br>
返回：处理后的字节数组及其长度<br>
说明：服务端发送到客户端数据<strong>加密前</strong>调用此接口</p>
<p><code>byte[] ServerEncode(byte[] encryptdata, int datalength, out int outlength)</code><br>
参数：需要编码的字节数组及其长度<br>
返回：编码后的字节数组及其长度<br>
说明：服务端发送到客户端数据<strong>加密后</strong>调用此接口</p>
<p><code>byte[] ServerDecode(byte[] encryptdata, int datalength, out int outlength, out bool needdecrypt, out bool needsendback)</code><br>
参数：需要解码的字节数组及其长度<br>
返回：解码后的字节数组及其长度，以及needdecrypt标记数据是否需要解密（一般都应该为true），以及needsendback标记是否立即回发客户端数据。如needsendback为true，则会立即调用ServerEncode并发送其返回结果，调用时参数是一个长度为0的字节数组<br>
说明：服务端收到客户端数据在<strong>解密前</strong>调用此接口</p>
<p><code>byte[] ServerPostDecrypt(byte[] plaindata, int datalength, out int outlength)</code><br>
参数：需要处理的字节数组及其长度<br>
返回：处理后的字节数组及其长度<br>
说明：服务端收到客户端数据在<strong>解密后</strong>调用此接口</p>
<p><code>byte[] ClientUdpPreEncrypt(byte[] plaindata, int datalength, out int outlength)</code><br>
参数：需要处理的字节数组及其长度<br>
返回：处理后的字节数组及其长度<br>
说明：客户端发送到服务端UDP数据<strong>加密前</strong>调用此接口</p>
<p><code>byte[] ClientUdpPostDecrypt(byte[] plaindata, int datalength, out int outlength)</code><br>
参数：需要处理的字节数组及其长度<br>
返回：处理后的字节数组及其长度<br>
说明：客户端收到服务端UDP数据在<strong>解密后</strong>调用此接口</p>
<p><code>byte[] ServerUdpPreEncrypt(byte[] plaindata, int datalength, out int outlength)</code><br>
参数：需要处理的字节数组及其长度<br>
返回：处理后的字节数组及其长度<br>
说明：服务端发送到客户端UDP数据<strong>加密前</strong>调用此接口</p>
<p><code>byte[] ServerUdpPostDecrypt(byte[] plaindata, int datalength, out int outlength)</code><br>
参数：需要处理的字节数组及其长度<br>
返回：处理后的字节数组及其长度<br>
说明：服务端收到客户端UDP数据在<strong>解密后</strong>调用此接口</p>
<h3><a id="user-content-插件编写" class="anchor" href="#插件编写" aria-hidden="true"><svg aria-hidden="true" class="octicon octicon-link" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>插件编写</h3>
<p>有两类插件，一类是协议插件，一类是混淆插件</p>
<p>其中接口InitData, SetServerInfo, Dispose接口必须实现，其它的接口为通讯接口</p>
<p>编写协议插件的话，需要重写ClientPreEncrypt, ClientPostDecrypt, ServerPreEncrypt, ServerPostDecrypt，其它的按原样返回，needdecrypt必须为true，needsendback必须为false</p>
<p>编写混淆插件的话，需要重写ClientEncode, ClientDecode, ServerEncode, ServerDecode，其它的按原样返回。</p>
<p>如果编写的部分仅含客户端部分，那么只需要编写Client为前缀的两个接口，服务端同理。</p>
<p>目前支持此插件接口的，有 <a href="https://github.com/shadowsocksr/shadowsocksr-csharp/releases">ShadowsocksR C#</a> 和 <a href="https://github.com/shadowsocksr/shadowsocks/tree/manyuser">ShadowsocksR Python</a></p>
</article>
  </div>
