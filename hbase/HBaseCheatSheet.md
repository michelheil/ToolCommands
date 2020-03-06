# Comprehensive Tutorial for HBase shell commands
https://learnhbase.net/2013/03/02/hbase-shell-commands/

## Open hbase shell
hbase shell

## List all tables
list 

## List all namespaces
list_namespace

## Create table "myFirstTable" with column family "colF"
create 'myFirstTable', 'colF'

## describe a table
describe 'myFirstTable'

## scan complete table
scan 'namespace:tablename'

## Read HBase Shell Commands from a Command File
./hbase shell ./sample_commands.txt
