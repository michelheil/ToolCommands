# Installation on Ubuntu
https://computingforgeeks.com/how-to-install-apache-hadoop-hbase-on-ubuntu/

# Where to find hbase-site.xml of HBase installation
hadoop@michael-PRIME-Z390-A:~$ more /usr/local/HBase/conf/hbase-site.xml

# How to start HBase server
## Start Hadoop (DFS and YARN)
sudo su - hadoop
start-dfs.sh
start-yarn.sh
start-hbase.sh
local-master-backup.sh start 2
local-regionservers.sh start 3

## Stop Hadoop and HBase
local-regionservers.sh stop 3
local-master-backup.sh stop 2
stop-hbase.sh
stop-yarn.sh
stop-dfs.sh

### Check ports used by hadoop
    NameNode – Default HTTP port is 9870.
    ResourceManager – Default HTTP port is 8088.
    MapReduce JobHistory Server – Default HTTP port is 19888.


### If HMaster is not starting
https://stackoverflow.com/questions/28295521/hbase-hdfs-integration-hbase-master-not-starting


## Alles in einem Script zusammengefasst
(als user 'michael')
cd ~/GitHubRepositories/ToolCommands/hadoop
bash start.sh


# Where to find logs:
/usr/local/HBase/logs

# HBase Configuration files
[HBase Configuration File Descriptions](https://hbase.apache.org/book.html#_configuration_files)

/usr/local/HBase/conf$ ls
* hadoop-metrics2-hbase.properties
* hbase-env.cmd
* hbase-env.sh
* hbase-policy.xml
* hbase-site.xml
* log4j-hbtop.properties
* log4j.properties
* regionservers


# Add the following to the hbase-site.xml
<property>
  <name>hbase.security.authentication</name>
  <value>simple</value>
</property>
<property>
  <name>hbase.security.authorization</name>
  <value>true</value>
</property>
<property>
  <name>hbase.coprocessor.master.classes</name>
  <value>org.apache.hadoop.hbase.security.access.AccessController</value>
</property>
<property>
  <name>hbase.coprocessor.region.classes</name>
  <value>org.apache.hadoop.hbase.security.access.AccessController</value>
</property>
<property>
  <name>hbase.coprocessor.regionserver.classes</name>
  <value>org.apache.hadoop.hbase.security.access.AccessController</value>
</property>




## backup-masters

    Not present by default. A plain-text file which lists hosts on which the Master should start a backup Master process, one host per line.

## hadoop-metrics2-hbase.properties

    Used to connect HBase Hadoop’s Metrics2 framework. See the Hadoop Wiki entry for more information on Metrics2. Contains only commented-out examples by default.

## hbase-env.cmd and hbase-env.sh

    Script for Windows and Linux / Unix environments to set up the working environment for HBase, including the location of Java, Java options, and other environment variables. The file contains many commented-out examples to provide guidance.

## hbase-policy.xml

    The default policy configuration file used by RPC servers to make authorization decisions on client requests. Only used if HBase security is enabled.

## hbase-site.xml

    The main HBase configuration file. This file specifies configuration options which override HBase’s default configuration. You can view (but do not edit) the default configuration file at docs/hbase-default.xml. You can also view the entire effective configuration for your cluster (defaults and overrides) in the HBase Configuration tab of the HBase Web UI.

## log4j.properties

    Configuration file for HBase logging via log4j.

## regionservers

    A plain-text file containing a list of hosts which should run a RegionServer in your HBase cluster. By default this file contains the single entry localhost. It should contain a list of hostnames or IP addresses, one per line, and should only contain localhost if each node in your cluster will run a RegionServer on its localhost interface.

