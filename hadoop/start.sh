#!/usr/bin/env bash
sudo su - hadoop start-dfs.sh
sudo su - hadoop start-yarn.sh
sudo su - hadoop start-hbase.sh
sudo su - hadoop local-master-backup.sh start 2
sudo su - hadoop local-regionservers.sh start 3
