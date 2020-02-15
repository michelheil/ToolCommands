#!/usr/bin/env bash
sudo su - hadoop local-master-backup.sh stop 2
sudo su - hadoop local-regionservers.sh stop 3
sudo su - hadoop stop-hbase.sh
sudo su - hadoop stop-dfs.sh
sudo su - hadoop stop-yarn.sh
