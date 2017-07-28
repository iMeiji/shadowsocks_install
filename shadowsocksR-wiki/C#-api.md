使用此API可读写所有节点配置和部分客户端配置

首先需要手动添加token，在客户端配置文件内：




	"token" : {
		"testapp" : "123456"
	},





其中key为app name，value为token，可随意修改

使用http get或post访问软件的监听端口，假设为1080，访问入口为 http://127.0.0.1:1080/api

参数包括：

app: 访问API的程序的app name

token: 访问所使用的token

action: 要执行的操作，值为"statistics"或"config"，分别表示获取统计信息，和读写配置信息

config: 当action为"config"时使用这个参数表示修改配置，值为配置字符串，json格式

配置完成后，使用浏览器访问`http://127.0.0.1:1080/api?action=statistics&app=testapp&token=123456`即可查看统计信息

以下为使用python2修改配置的示例：
```
import urllib
import urllib2

data = {}
data['config'] = """{
	"configs" : [
		{
			"remarks" : "",
			"server" : "192.168.0.1",
			"server_port" : 443,
			"password" : "password",
			"method" : "rc4-md5",
			"obfs" : "tls1.2_ticket_auth",
			"obfsparam" : "",
			"remarks_base64" : "",
			"group" : "test",
			"udp_over_tcp" : false,
			"protocol" : "auth_sha1_v2",
			"enable" : true,
			"id" : "914D0BA738F8E4E2BA3464A26D031E76"
		}
	]
}"""
data['app'] = "testapp"
data['token'] = "123456"
url="http://127.0.0.1:1080/api?action=config"
request = urllib2.Request(url, urllib.urlencode(data))
response = urllib2.urlopen(request)

print response.read()
```
以上仅为修改示例，省略了其它的配置项（省略的项将会恢复为默认配置）。如果不需要修改节点外的信息，请先通过API获取原配置然后合并