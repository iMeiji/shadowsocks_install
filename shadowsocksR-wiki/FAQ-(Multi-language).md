* SSR全称是什么？

  正确为ShadowsocksR，有人称之为Shadowsocks-rss是错误的，rss是Really Simple Syndication的缩写

* 服务端混淆参数需要和客户端一样吗？

  不需要，服务端的参数含义完全不一样，建议详细阅读说明，且在多用户模式下，其参数不应由用户自定义，应该由管理员预设好

* 客户端任务栏图标有什么快捷操作？

  左键点击弹出服务器编辑窗口，中键点击或ctrl+左键弹出服务器统计窗口，右键弹出菜单，shift+左键弹出选项设置窗口

* 客户端任务栏图标颜色有什么含义？

  关闭系统代理时为蓝色，PAC模式时绿色，全局时青色，开启负载均衡时在前面的颜色里加上红色

* 怎么配置最快？为什么有时混淆还不如原版？

  根据你所在的地区及ISP的策略，分几种情况：

* 如果没有防火墙，不加密直连最快

  如果有墙，但没有不明流量干扰也没有QoS，原版最快

* 如果有特征识别限速但没有Qos，仅设置协议不开启混淆的SSR最快

  如果有QoS，设置混淆后的SSR最快

* 怎么配置安全性最高？

  设置协议为auth_aes128_md5或auth_aes128_sha1，服务端至少设置一个redirect目标。而混淆不管哪种均可，不影响安全性

***

* What does SSR stand for?

  SSR is ShadowSocksR, some people call it Shadowsocks-rss which is wrong. RSS stands for Really Simple Syndication.

* Do server side obfuscation parameters need to be the same as the client side configuration?

  No. Server side parameters mean differently than client side parameters. Please read our documentation carefully. Under multi-user environment, parameters values should be defined by server administrator, not by the client user.

* Shortcut operations on the tray icon?

  Left click to edit server list.
  Middle click / ctrl + left click shows the usage statistics.
  Right click for menu
  Shift + right click to bring up settings window.
  In the tray, what does the colour of the icon mean?

  Blue: Proxy turned off
  Green: PAC proxy
  Cyan: System-wide proxy
  Red mixed with any of the above: load balancing.
  What is the quickest way to browse internet with ShadowSocks?

* Depend on your ISP and your location, there are several situations.

  If no firewall is present, direct connection seems fastest.
  If the GFW is in place but without any interference on encrypted traffic, `origin` and `plain` is the fastest.
  If GFW with characteristic recognision, but no QoS, set protocol but obfuscation in SSR.
  If GFW with characteristic recognision + QoS, also set obfuscation.
  How to setup the most secure configuration?

* Protocol set to `auth_aes128_md5` or `auth_aes128_sha1`, set at least 1 redirect target in server parameter. Obfuscation can be anything you like, it does not affect the security level.