# Ubuntu SetUp

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
```shell
suod apti
```
#### 2.1.4 安装git

```shell
# 安装git
sudo apt install git
# 查看git 版本信息
git --version
```

#### 2.1.5 安装curl

```shell
sudo apt intall curl
```





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







