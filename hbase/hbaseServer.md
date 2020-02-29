# Where to find hbase-site.xml of HBase installation
sudo -su hadoop bash
hadoop@michael-PRIME-Z390-A:~$ more /usr/local/HBase/conf/hbase-site.xml


# How to start HBase server
cd ~/GitHubRepositories/ToolCommands/hadoop
sudo -u hadoop bash start.sh


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

