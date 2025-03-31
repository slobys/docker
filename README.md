# Dcoker一键安装
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
sudo apt install git -y && git clone https://github.com/slobys/docker.git && cd docker && chmod +x docker.sh && ./docker.sh
```

  
