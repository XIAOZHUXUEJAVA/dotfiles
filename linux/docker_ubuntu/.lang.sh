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