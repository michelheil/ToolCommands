##############################################
## Install git
##############################################
sudo apt install git

##############################################
## Use SSH to connect with GitHub
##############################################
https://help.github.com/en/enterprise/2.15/user/articles/adding-a-new-ssh-key-to-your-github-account


##############################################
## install sublime text 3
##############################################
# https://linuxize.com/post/how-to-install-sublime-text-3-on-ubuntu-18-04/
sudo apt update
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt update
sudo apt -y install sublime-text


##############################################
## install OpenJDK 8
##############################################
sudo apt install openjdk-8-jdk openjfx


##############################################
## Java Environment
##############################################
## set JAVA_HOME via command linea append
sudo tee -a /etc/environment <<< "JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64/jre/'"
source /etc/environment
echo $JAVA_HOME

##############################################
## install scala
##############################################
# https://medium.com/@josemarcialportilla/installing-scala-and-spark-on-ubuntu-5665ee4b62b1
sudo apt-get -y install scala
scala -version

##############################################
## install Python
##############################################
# https://linuxize.com/post/how-to-install-pip-on-ubuntu-18.04/
sudo apt install python3-pip
pip3 --version

##############################################
## install Hadoop and HBase
##############################################
#
https://computingforgeeks.com/how-to-install-apache-hadoop-hbase-on-ubuntu/


##############################################
## install docker and docker compse
##############################################
# bash install_docker_dockerCompose.sh

##############################################
## install mail programm mailspring
##############################################
sudo apt-get install mailspring


##############################################
## install gitkraken
##############################################
# https://support.gitkraken.com/how-to-install/?query=
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb
dpkg -i gitkraken-amd64.deb
rm gitkraken-amd64.deb

sudo apt update
sudo apt -y install gconf2
sudo apt --fix-broken install

##############################################
## install maven
##############################################
sudo apt install maven


##############################################
## install sbt
##############################################
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update
sudo apt-get install sbt

##############################################
## install intellij
##############################################
# https://itsfoss.com/install-intellij-ubuntu-linux/
sudo snap install intellij-idea-community --classic
snap list --all

##############################################
## install PulseView (AZ Delivery Logic Analyzer)
##############################################
# https://jakemakes.eu/saleae-logic-analyzer-software-install-on-linux/
sudo apt-get install pulseview -y


##############################################
## install PyCharm Community Edition
##############################################
# Aus der Ubuntu Software (einfach suchen)

##############################################
## install CLion
##############################################
# Gibt es leider nicht in der Community Version sondern muss bezahlt werden
# Aus der Ubuntu Software (einfach suchen)




##############################################
## install vim editor
##############################################
sudo apt install vim

##############################################
## install ssh-server
##############################################
sudo apt install openssh-server
sudo service ssh status

##############################################
## install slack
##############################################
# https://websiteforstudents.com/installing-slack-for-linux-on-ubuntu-16-04-17-10-18-04/
sudo apt install snap
sudo snap install slack --classic


##############################################
## install spotify
##############################################
snap install spotify


##############################################
## install rhythmbox (music player)
##############################################
sudo apt-get install rhythmbox

##############################################
## install VLC (video player)
##############################################
sudo apt-get install vlc

##############################################
## Mosquitto MQTT
##############################################
sudo apt-get install mosquitto mosquitto-clients

##############################################
## Microsoft Visual Studio Code
##############################################
sudo snap install --classic code

sudo apt-get install avr-libc gcc-avr gcc
sudo apt-get install doxygen doxygen-doc doxygen-gui graphviz 

# ensure that the user michael is part of the correct userGroup in order to access the USB ports
ls -l /dev/ttyACM3
sudo adduser michael dialout
# check with command "groups", a restart is necessary

##############################################
## Installing Boot Repair on Ubuntu
##############################################
# http://linuxpitstop.com/repair-grub-boot-loader-on-ubuntu-linux/
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install -y boot-repair


##############################################
## Installing Zeppelin
##############################################
APP="zeppelin"
URL="https://www-us.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz"
INSTFILE=${URL##*/}
mkdir $HOME/$APP && cd $HOME/$APP
wget "${URL}"
tar zxvf $INSTFILE

bin/zeppelin-daemon.sh start
# bin/zeppelin-daemon.sh stop

# Analog: Spark, Kafka


##############################################
# uninstall apt
##############################################
# https://vitux.com/how-to-uninstall-programs-from-your-ubuntu-system/


sudo apt-get update
sudo apt-get upgrade

dpkg --list
#sudo apt-get purge “package-name”
#sudo apt-get autoremove
