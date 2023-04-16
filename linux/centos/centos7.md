# Centos 初始化
## 基础安装
### 更新软件包
```shell
sudo yum update
```

### 修改etc/vimrc
```
" 设置编码格式
set enc=utf-8

 " 去掉输入错误的提示音
set noeb

" Tab键的宽度
set tabstop=4
 
" 统一缩进为4
set softtabstop=4
 
" 显示行号
set number
 
" ====================快捷键映射设置====================

" 切换到normal模式
inoremap jk <ESC>
 
```


### 安装ssh(如果没有安装的话)

```shell
ssh -V
sudo yum install openssh-server  
```
### 修改ssh_config允许根用户远程登录

```shell
sudo vim /etc/ssh/sshd_config
```
`permitRootLogin yes`

### 重启ssh
```shell
sudo systemctl start sshd
```

### 安装git
```shell
sudo yum install git -y
```

### 安装zsh

```shell
sudo yum -y install zsh
```
### 切换shell
```shell
chsh -s /bin/zsh
```

### 安装oh-my-zsh
```shell
sh -c "$(curl -fsSL https://gitee.com/shmhlsy/oh-my-zsh-install.sh/raw/master/install.sh)"
```
```shell
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 修改语言
.bash_profile 
```
export LANG=en_US.UTF-8
```

### 关闭防火墙

```shell
sudo systemctl stop firewalld
```