# Installation (Version 0.8.1)
APP="zeppelin"
URL="https://www-us.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz"
INSTFILE=${URL##*/}
mkdir $HOME/$APP && cd $HOME/$APP
wget "${URL}"
tar zxvf $INSTFILE

# Installation (Version 0.9.0)
APP="zeppelin"
URL="https://www-us.apache.org/dist/zeppelin/zeppelin-0.9.0/zeppelin-0.9.0-bin-all.tgz"
INSTFILE=${URL##*/}
cd $HOME/$APP
wget "${URL}"
tar zxvf $INSTFILE
sudo rm current
sudo ln -s -f zeppelin-0.9.0-bin-all current

# Start/Stop
bash ~/zeppelin/current/bin/zeppelin-daemon.sh start
bash ~/zeppelin/current/bin/zeppelin-daemon.sh stop

# Make changes in spark Zeppelin interpreter
SPARK_HOME /home/michael/spark/current
spark.executor.cores 4
zeppelin.spark.enableSupportedVersionCheck false
zeppelin.spark.uiWebUrl http://localhost:4040 FUNKTIONIERT ABER NICHT!