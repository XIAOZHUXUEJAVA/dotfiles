#!/bin/bash

# 1. 更新 apt，并自动升级所有已安装的包
echo "====================更新 apt===================="
sudo apt update -y && sudo apt upgrade -y

# 2. 安装 Go 环境
echo "====================安装 Go===================="
sudo wget https://golang.google.cn/dl/go1.18.5.linux-amd64.tar.gz 
sudo tar xfz go1.18.5.linux-amd64.tar.gz -C /usr/local
rm -rf go1.18.5.linux-amd64.tar.gz

# 2.1 配置Go环境变量
echo "export GOROOT=/usr/local/go" >> ~/.zshrc
echo "export GOPATH=\$HOME/gowork" >> ~/.zshrc
echo "export GOBIN=\$GOPATH/bin" >> ~/.zshrc
echo "export PATH=\$GOPATH:\$GOBIN:\$GOROOT/bin:\$PATH" >> ~/.zshrc

# 3. 安装 Java 环境
echo "====================安装 Java===================="
sudo apt install openjdk-8-jdk -y
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.zshrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.zshrc
echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> ~/.zshrc
echo "export JAVA_TOOL_OPTIONS=\"-Dfile.encoding=UTF-8\"" >> ~/.zshrc

# 4. 安装 C/C++ 编译环境
echo "====================安装 C/C++ 编译环境===================="
sudo apt install build-essential gdb cmake -y

# 5. 安装 Python3 环境和工具
echo "====================安装 Python3 环境和工具===================="
sudo apt install python3 -y
sudo apt install python3-venv -y
sudo apt install python3-setuptools -y

# 6. 安装 Node.js 和 npm，使用淘宝源加速
echo "====================安装 Node.js===================="
sudo apt install npm -y
sudo npm config set registry https://registry.npmmirror.com/
sudo apt install nodejs -y
sudo npm install n -g -y
sudo n stable
sudo npm install -g tldr -y

# 7. 安装 Redis
echo "====================安装 Redis===================="
sudo apt-get install -y redis-server


# 8. 安装 Rust 环境
echo "====================安装 Rust===================="
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo "export PATH=$HOME/.cargo/bin:$PATH" >> ~/.zshrc
/root/.cargo/bin/rustup default stable