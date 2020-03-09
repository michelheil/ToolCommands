#!/usr/bin/env bash
sudo su - hadoop local-master-backup.sh stop 2
sudo su - hadoop local-regionservers.sh stop 3
sudo su - hadoop stop-hbase.sh
sudo su - hadoop stop-dfs.sh
sudo su - hadoop stop-yarn.sh

# clean logs. if Zookeeper logs get too big, HBase Master cannot find Regions
cd /usr/local/HBase/logs
sudo rm hbase-hadoop*.log
sudo rm hbase-hadoop*.out

cd /usr/local/hadoop/logs
sudo rm hadoop-hadoop*.log
sudo rm hadoop-hadoop*.out

cd /home/hadoop/zookeeper/version-2
sudo rm log.*
