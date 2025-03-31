# SSL一键申请
## 脚本功能
* 一键安装Docker和独立版Docker-Compose

## 安装git
### Debian和Ubuntu系统
```bash
sudo apt install git -y
```
### CentOS系统
```
sudo yum install git -y
```

### 如果执行后出错，请先更新系统
* （Debian/Ubuntu系统）
```bash
sudo apt update -y
```
* （CentOS系统）
```bash
sudo yum update -y
```
## 一键脚本
```bash
git clone https://github.com/slobys/SSL-Renewal.git /tmp/acme && mv /tmp/acme/* /root && bash acme_2.0.sh
```
## 注意事项  
* 请不要用同一个域名频繁申请，这样容易出错
* 如果遇到出错可以参考以下解决办法  
  1、换个域名申请  
  2、换个时间再申请

  
