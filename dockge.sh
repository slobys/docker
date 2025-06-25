#!/bin/bash

set -e  # 遇到错误立即退出

echo "🚀 开始安装 Docker..."
curl -fsSL https://get.docker.com | bash

echo "🔹 启动并设置 Docker 开机自启..."
sudo systemctl enable --now docker

echo "🚀 获取最新版本的 Docker Compose..."
LATEST_VERSION=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep '"tag_name":' | cut -d '"' -f 4)

echo "🔹 最新版本为：$LATEST_VERSION"
COMPOSE_URL="https://github.com/docker/compose/releases/download/$LATEST_VERSION/docker-compose-linux-x86_64"

echo "🚀 开始安装 Docker Compose..."
sudo curl -SL "$COMPOSE_URL" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "✅ 安装完成！"
echo "🔹 Docker 版本："
docker --version
echo "🔹 Docker Compose 版本："
docker-compose --version
