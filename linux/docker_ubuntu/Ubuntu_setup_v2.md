# Ubuntu SetUp -----用于配置算法环境

## 1. docker

### 1.1 拉取一个Ubuntu镜像

```shell
docker pull ubuntu:latest
```



### 1.2 查看本地镜像

```shell
docker images
```



### 1.3 运行容器

```shell
docker run -itd --name ubuntu-setup ubuntu
```



### 1.4 进入 容器

```shell
docker exec -it ubuntu-setup /bin/bas
```

## 2. Ubuntu

进入到ubuntu容器后，感觉docker ubuntu container 还是非常干净的。我们常用的vim sudo工具都没有，需要我们自己配置。

### 2.1 安装必要工具

#### 2.1.1 更新软件库

此过程可能较慢

```shell
apt update
```



#### 2.1.2 安装sudo

```shell
apt install sudo
```



#### 2.1.3 安装vim

```shell
sudo apt install vim
```

#### 2.1.4 安装git

```shell
# 安装git
sudo apt install git
# 查看git 版本信息
git --version
# 设置user and email
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

#### 2.1.5 安装curl

```shell
sudo apt intall curl
```



#### 2.1.6 安装wget

```shell
sudo apt install wget
```



#### 2.1.7 安装neovim

```shell
# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update -y
sudo apt-get install neovim -y
```



#### 

### 2.2 zsh

#### 2.2.1 安装zsh

```shell
sudo apt install 
```

#### 2.2.2 查看zsh版本

```shell
zsh --version
```

#### 2.2.3  设置默认shell 为 zsh

```shell
chsh -s /bin/zsh
# 或者使用以下命令
chsh -s $(which zsh)
```

同理, 使用以下命令可以切换到 bash

```shell
chsh -s /bin/bash
```



#### 2.2.4 退出容器，以zsh重新进入

```shell
exit
docker exec -it ubuntu-setup /bin/zsh
```



#### 2.2.5 oh-my-zsh

##### 2.2.5.1 安装oh-my-zsh

```shell
# 国外资源 过于慢
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 再试试这个命令
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 还不行的话使用，使用国内资源
sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
```



##### 2.2.5.2 配置oh-my-zsh

配置zsh主题

```shell
vim .zshrc、

# 将zsh 主题改为我们心仪的主题，其实默认的就b
ZSH_THEME="robbyrussell" 
```



使我们的zsh配置生效

```shell
#将我们的配置生效一下
source .zshrc
```



### 2.3 vscode

首先我们需要安装插件，这四个插件我们可以都安装上，以免使用不了

![image-20221219170112773](https://raw.githubusercontent.com/XIAOZHUXUEJAVA/GraphBed/main/img/202212191701878.png)



![image-20221219170521556](https://raw.githubusercontent.com/XIAOZHUXUEJAVA/GraphBed/main/img/202212191705602.png)



#### 2.3.1 配置java环境

```shell
sudo apt install openjdk-8-jdk

# 配置环境变量在 ~/.zshrc中添加如下
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
# 设置环境字符集
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8"
# 设置java编译默认字符集
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"
```



安装插件Extension Pack for java

![image-20221219192535129](https://raw.githubusercontent.com/XIAOZHUXUEJAVA/GraphBed/main/img/202212191925258.png)



#### 2.3.2 配置go环境

下载go包

```shell
sudo wget https://golang.google.cn/dl/go1.18.5.linux-amd64.tar.gz

# 解压
sudo tar xfz go1.18.5.linux-amd64.tar.gz -C /usr/local
```



```shell
export GOROOT=/usr/local/go
export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH
```





```shell
go env -w GOPROXY="https://goproxy.cn,direct"
go env -w GO111MODULE="on"
go env
```



设置go代理

![image-20221220224913455](https://raw.githubusercontent.com/XIAOZHUXUEJAVA/GraphBed/main/img/202212202249559.png)





#### 2.3.3 配置c/c++环境

安装插件 c/c++ Code Runner

![image-20221220000053322](https://raw.githubusercontent.com/XIAOZHUXUEJAVA/GraphBed/main/img/202212200000363.png)



![image-20221220000105816](https://raw.githubusercontent.com/XIAOZHUXUEJAVA/GraphBed/main/img/202212200001851.png)

```shell
sudo apt update
# 通过以下命令安装编译器和调试器，gdb是Linux下常用的程序调试器, build-essential中有我们需要的gcc和g++
sudo apt install build-essential gdb

# 如果成功，则显示版本号
gcc --version
g++ --version
gdb --version
```



简单使用

main.cpp

```c
#include <iostream>
#include "functions.h"
using namespace std;
int main() {
    cout<<"hello main"<<endl;
    hello();
}
```



hello.cpp

```c
#include <iostream>
#include "functions.h"
using namespace std;

void hello() {
    cout<<"hello"<<endl;
}
```



functions.h

```c
#ifndef _FUNCTIONS_H_
#define _FUNCTIONS_H_
void hello();
#endif
```



编译

```shell
g++ hello.cpp main.cpp -o main
```



运行

```shell
./main
```



安装cmake

```shell
sudo apt install cmake
```



简单使用

CMakeLists.txt 用于生成makefile

```cmake
cmake_minimum_required(VERSION 3.22)

project(hello)

add_executable(hello main.cpp hello.cpp)
```



```shell
# 在当前目录下寻找CMakeLists.txt
cmake .
# 编译
make
# 运行
./hello
```



我们也可以首先创建一个build目录，进入这个目录之后，使用cmake

```shell
mkdir build
cd build
# 在上一级目录中寻找CMakeLists.txt
cmake ..
```







## 3. shell

### 3.1 准备工作

新建一个docker 容器

```shell
dokcer run -itd --name ubuntu-sh ubuntu
```



进入容器

```shell
docker exec --it ubuntu-sh /bin/bash
```



更新apt

```shell
apt update
```



进入根

```shell
cd root
```

安装sudo

```shell
apt install sudo 
```



安装vim

```shell
sudo apt install vim -y
```



### 3.2 zsh

新建脚本文件

```shell
vim zsh.sh
```





```sh
echo "====================update apt====================\n"
sudo apt update -y && sudo apt upgrade -y

echo "====================changing shell to zsh====================\n"
sudo apt install zsh git curl wget -y

chsh -s $(which zsh)
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
zsh

```





保存后，赋予权限

```shell
sudo chmod u+x zsh.sh
```



运行脚本

```shell
./zsh.sh
```



### 3.3 环境

#### 3.3.1 安装

新建一个.java_go_install.sh文件

```shell
# install java8
sudo apt install openjdk-8-jdk -y
# install go
sudo wget https://golang.google.cn/dl/go1.18.5.linux-amd64.tar.gz 
sudo tar xfz go1.18.5.linux-amd64.tar.gz -C /usr/local
rm -rf go1.18.5.linux-amd64.tar.gz
```



```shell
# 赋予权限
sudo chmod u+x .java_go_install.sh
# 运行
./.java_go_install.sh
```







#### 3.3.2 配置变量

新建一个env_java_go.sh脚本文件

```shell
vim .java_go_env.sh
```



输入环境变量

```sh
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_TOOL_OPTIONS="-Dfile.encoding=UTF-8"


export GOROOT=/usr/local/go
export GOPATH=$HOME/gowork
export GOBIN=$GOPATH/bin
export PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH
```



在~/.zshrc文件中输入

```shell
source ~/.java_go_env.sh
```



然后使用命令

```shell
source ~/.zshrc
```



重启



`export PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH` 和 `export PATH=$JAVA_HOME/bin:$PATH`会不会出现冲突？

不会。`export PATH=$GOPATH:$GOBIN:$GOROOT/bin:$PATH` 和 `export PATH=$JAVA_HOME/bin:$PATH` 这两条命令均在设置环境变量 `PATH` 的值。

在这两条命令中，第一条命令中的 `$GOPATH:$GOBIN:$GOROOT/bin` 是将 Go 的工作区路径、可执行文件的路径和 Go 的安装路径添加到 `PATH` 中。第二条命令中的 `$JAVA_HOME/bin` 则是将 Java 的安装路径添加到 `PATH` 中。

两条命令中都有 `:$PATH`，这意味着它们会将原来 `PATH` 中的路径保留下来。因此，这两条命令不会冲突，而是会将 Go 和 Java 的路径都添加到 `PATH` 中。







#### 3.3.3 整合一下所有的.sh文件



我们只需要运行一下这两个脚本文件，就可以初步的使用这个容器了！

.zsh.sh

```sh
echo "====================update apt====================\n"
sudo apt update -y && sudo apt upgrade -y

echo "====================changing shell to zsh====================\n"
sudo apt install zsh git curl wget -y

chsh -s $(which zsh)
# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
zsh
```





.lang.sh

```shell
echo "====================update apt====================\n"
sudo apt update -y && sudo apt upgrade -y

echo "====================install go====================\n"
sudo wget https://golang.google.cn/dl/go1.18.5.linux-amd64.tar.gz 
sudo tar xfz go1.18.5.linux-amd64.tar.gz -C /usr/local
rm -rf go1.18.5.linux-amd64.tar.gz

echo "export GOROOT=/usr/local/go" >> ~/.zshrc
echo "export GOPATH=\$HOME/gowork" >> ~/.zshrc
echo "export GOBIN=\$GOPATH/bin" >> ~/.zshrc
echo "export PATH=\$GOPATH:\$GOBIN:\$GOROOT/bin:\$PATH" >> ~/.zshrc


echo "====================install java8====================\n"
sudo apt install openjdk-8-jdk -y
echo "export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> ~/.zshrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.zshrc
echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> ~/.zshrc
echo "export JAVA_TOOL_OPTIONS=\"-Dfile.encoding=UTF-8\"" >> ~/.zshrc

echo "====================install c/c++====================\n"
sudo apt install build-essential gdb camke -y

echo "====================install python3====================\n"
sudo apt install python3 -y
sudo apt install python3-venv -y
sudo apt install python3-setuptools -y

echo "====================install nodejs====================\n"
# install npm
sudo apt install npm -y
# switch to taobao mirror source
sudo npm config set registry https://registry.npmmirror.com/
# install nodejs
sudo apt install nodejs -y
# install nodejs manangement tools
sudo npm install n -g -y
# update nodejs to stable version
sudo n stable
# install to long dont read
sudo npm install -g tldr -y

echo "====================install redis====================\n"
sudo apt-get install -y redis-server
```





.tools.sh  后续有什么需要的工具我们在这个脚本文件中添加

```shell
# install neovim
sudo apt install neovim -y
```







