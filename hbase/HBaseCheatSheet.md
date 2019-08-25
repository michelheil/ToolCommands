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