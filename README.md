# clash-service
### 目标：
用于简化centos命令行使用clash。
### clash版本：
基于clash-v1.17.0[https://github.com/Dreamacro/clash/releases/tag/v1.17.0]
### 使用步骤：
1. 将所有文件下载之后存放在centos任意路径，进入该文件夹，执行```wget -O config.yaml "clash的订阅链接" --no-check-certificate```下载你的配置文件
2. 执行```AddClashService.sh```
3. 执行```Systemctl start clash```
4. 最后打开新的命令行终端，执行```wget google.com```，如果你的订阅有效，就可以看到这样的画面：
   ![Uploading image.png…]()
### 删除操作
如果你想移除clash服务，执行```RemoveClashService.sh```。
