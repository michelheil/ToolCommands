# Installation (Version 0.8.1)
APP="zeppelin"
URL="https://www-us.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz"
INSTFILE=${URL##*/}
mkdir $HOME/$APP && cd $HOME/$APP
wget "${URL}"
tar zxvf $INSTFILE

# Start/Stop
bash ~/zeppelin/current/bin/zeppelin-daemon.sh start
bash ~/zeppelin/current/bin/zeppelin-daemon.sh stop