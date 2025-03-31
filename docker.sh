#!/bin/bash

set -e  # 遇到错误立即退出

echo "🔹 更新系统包管理器..."
sudo apt update -y || sudo yum update -y

echo "🔹 安装必要依赖..."
sudo apt install -y curl ca-certificates gnupg lsb-release || sudo yum install -y curl ca-certificates gnupg lsb-release

echo "🔹 添加 Docker 官方 GPG 密钥..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/gpg | sudo tee /etc/apt/keyrings/docker.asc > /dev/null
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo "🔹 添加 Docker 官方源..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔹 更新包索引并安装 Docker..."
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "🔹 启动并设置 Docker 开机自启..."
sudo systemctl enable --now docker

echo "🔹 安装独立版 docker-compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "✅ 安装完成！"
echo "🔹 Docker 版本："
docker --version
echo "🔹 Docker Compose 版本："
docker-compose --version
