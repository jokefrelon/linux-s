# Linux 脚本合集
这个仓库是我用来存放我平时写的一些小脚本
## 1. [netspeed.sh](netspeed.sh)
简介：netspeed.sh是一个轻量且快速的查看当前网卡实时网速的脚本(Ubuntu 18~20适用)
由于不支持参数，所以默认查看的是你物理网卡的当前网速
注：脚本依赖于ifconfig命令，Ubuntu现在默认没有安装该命令，需要手动安装一下

```
sudo apt install net-tools
```
如果脚本无法在您的设备的系统上运行您可以自行修改或者issue

## 2. [Openwrt](Openwrt.md)
openwrt相关的脚本，已过时，放弃维护。

## 3. [cputemp.sh](cputemp.sh)
此脚本适用于Ubuntu系列用一句话命令来查看当前CPU温度

## 4. [acme-sign.sh](acme-sign.sh)
借助[acme.sh](https://github.com/acmesh-official/acme.sh)项目,自动给我的二级子域名签发证书

## 5. [directorylister](Dockerfile/directorylister/Dockerfile)

这是一个Dockerfile用于快速构建docker版本的**directorylister**，在使用时你可以对端口进行映射，将容器内的8088端口映射到本地，这样你就可以通过局域网访问了。你也可以创建数据卷进行目录映射。例如：

```
docker run -id --name flubt -p 8088:8088 -v /home/lx/disk3/vm:/var/www/html/vm flubt bash -c 'bash /root/np.sh'
```

