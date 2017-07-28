配置文件各项说明

各选项说明（注意，你应该修改使用initcfg.sh脚本初始化后的user-config.json）：

<table>
<thead>
<tr>
<th>Name</th>
<th>Explanation</th>
<th>中文说明</th>
</tr>
</thead>
<tbody>
<tr>
<td>server</td>
<td>the address your server listens</td>
<td>监听地址</td>
</tr>
<tr>
<td>server_ipv6</td>
<td>the ipv6 address your server listens</td>
<td>ipv6地址</td>
</tr>
<tr>
<td>server_port</td>
<td>server port</td>
<td>监听端口</td>
</tr>
<tr>
<td>local_address</td>
<td>the address your local listens</td>
<td>本地地址</td>
</tr>
<tr>
<td>local_port</td>
<td>local port</td>
<td>本地端口</td>
</tr>
<tr>
<td>password</td>
<td>password used for encryption</td>
<td>密码</td>
</tr>
<tr>
<td>timeout</td>
<td>in seconds</td>
<td>超时时间</td>
</tr>
<tr>
<td>udp_timeout</td>
<td>in seconds</td>
<td>UDP链超时时间</td>
</tr>
<tr>
<td>udp_cache</td>
<td>cache size</td>
<td>UDP链缓冲区大小</td>
</tr>
<tr>
<td>method</td>
<td>default: "aes-256-cfb", see Encryption</td>
<td>加密方式</td>
</tr>
<tr>
<td>protocol</td>
<td>default："origin"</td>
<td>协议插件，默认"origin"</td>
</tr>
<tr>
<td>protocol_param</td>
<td>default：""</td>
<td>协议插件参数，默认""</td>
</tr>
<tr>
<td>obfs</td>
<td>default："tls1.2_ticket_auth_compatible"</td>
<td>混淆插件，默认"tls1.2_ticket_auth_compatible"</td>
</tr>
<tr>
<td>obfs_param</td>
<td>default：""</td>
<td>混淆插件参数，默认""</td>
</tr>
<tr>
<td>redirect</td>
<td>default：""</td>
<td>重定向参数，默认""</td>
</tr>
<tr>
<td>dns_ipv6</td>
<td>default:false</td>
<td>是否优先使用IPv6地址，有IPv6时可开启</td>
</tr>
<tr>
<td>fast_open</td>
<td>use TCP_FASTOPEN, true / false</td>
<td>快速打开(仅限linux客户端)</td>
</tr>
<tr>
<td>workers</td>
<td>number of workers, available on Unix/Linux</td>
<td>线程（仅限linux客户端）</td>
</tr>
<tr>
<td>verbose</td>
<td>display verbose debug info</td>
<td>显示调试信息</td>
</tr>
<tr>
<td>connect_verbose_info</td>
<td>display connection verbose info</td>
<td>显示连接信息</td>
</tr>
<tr>
<td>forbidden_ip</td>
<td>forbidden IP set for outbound</td>
<td>阻止连接到此IP列表</td>
</tr>
<tr>
<td>forbidden_port</td>
<td>forbidden port set for outbound</td>
<td>阻止连接到此端口列表</td>
</tr>
<tr>
<td>ignore_bind</td>
<td>not bind the IP set</td>
<td>不绑定的IP列表</td>
</tr>
<tr>
<td>out_bind</td>
<td>force bind this IPv4 IP</td>
<td>强制绑定此IPv4地址</td>
</tr>
<tr>
<td>out_bindv6</td>
<td>force bind this IPv6 IP</td>
<td>强制绑定此IPv6地址</td>
</tr>
<tr>
<td>additional_ports</td>
<td>additional ports for multiuser mode</td>
<td>多用户模式下配置额外端口</td>
</tr>
<tr>
<td>speed_limit_per_con</td>
<td>rate limit for each connection</td>
<td>单连接限速，单位KB</td>
</tr>
<tr>
<td>speed_limit_per_user</td>
<td>rate limit for each user</td>
<td>单用户限速，单位KB</td>
</tr>
</tbody>
</table>
其中各protocol与obfs介绍参见：

注：客户端的protocol和obfs配置必须与服务端的一致，除非服务端配置为兼容插件。

redirect参数说明：

值为空字符串或一个列表，若为列表示例如
`"redirect":["bing.com", "cloudflare.com:443"],`
作用是在连接方的数据不正确的时候，把数据重定向到列表中的其中一个地址和端口（不写端口则视为80），以伪装为目标服务器。

dns_ipv6参数说明：

为true则指定服务器优先使用IPv6地址。仅当服务器能访问IPv6地址时可以用，否则会导致有IPv6地址的网站无法打开。

一般情况下，只需要修改以下五项即可：


```
"server_port":8388,        //端口
"password":"password",     //密码
"protocol":"origin",       //协议插件
"obfs":"http_simple",      //混淆插件
"method":"aes-256-cfb",    //加密方式
```


## 多端口配置

如果要多个用户一起使用的话，请写入以下配置：

```
{
    "server":"0.0.0.0",
    "server_ipv6": "[::]",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
        "80":"password1",
        "443":"password2"
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "protocol": "auth_sha1_compatible",
    "protocol_param": "",
    "obfs": "http_simple_compatible",
    "obfs_param": "",
    "redirect": "",
    "dns_ipv6": false,
    "fast_open": false,
    "workers": 1
}
```


按照格式修改端口和密码：

```    "port_password":{                  
        "80":"password1",       //端口和密码1
        "443":"password2"       //端口和密码2 
    },         
```


如果要为每个端口配置不同的混淆协议，请写入以下配置：


```
{
    "server":"0.0.0.0",
    "server_ipv6":"::",
    "local_address":"127.0.0.1",
    "local_port":1080,
    "port_password":{
        "8388":{"protocol":"auth_simple", "password":"abcde", "obfs":"http_simple", "obfs_param":""},
        "8389":{"protocol":"origin", "password":"abcde"}
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "protocol": "auth_sha1_compatible",
    "protocol_param": "",
    "obfs": "http_simple_compatible",
    "obfs_param": "",
    "redirect": "",
    "dns_ipv6": false,
    "fast_open": false,
    "workers": 1
}
```

按格式修改端口、密码以及混淆协议。也可以和以前的格式混合使用，如果某个端口不配置混淆协议，则会使用下面的默认"obfs"配置。