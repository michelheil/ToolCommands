# Kafka Connect Example
https://docs.confluent.io/current/connect/userguide.html

## Connect-JARs
all connect jars are located in home/michael/confluent/confluent-5.5.0/share/java/kafka

## Running Standalone mode
https://docs.confluent.io/current/connect/userguide.html#standalone-mode

```bash
connect-standalone worker.properties connector1.properties [connector2.properties connector3.properties ...]
```

worker.properties can be found here:
etc/schema-registry/connect-avro-standalone.properties

conector.properties can be found here:
~/confluent/confluent-5.5.0/etc/kafka/


## Example on my Ubuntu


### Console-Source
```bash
connect-standalone ~/confluent/confluent-5.5.0/etc/kafka/connect-standalone.properties ~/confluent/confluent-5.5.0/etc/kafka/connect-console-source.properties
```


### File-Source
https://docs.confluent.io/current/connect/quickstart.html#connect-quickstart

In dem File `~/confluent/confluent-5.5.0/etc/kafka/connect-file-source.properties` wurde das textfile auf `/tmp/test.txt` geaendert.

```bash
connect-standalone ~/confluent/confluent-5.5.0/etc/kafka/connect-standalone.properties ~/confluent/confluent-5.5.0/etc/kafka/connect-file-source.properties
```



## hbase-sink-connector
Nachdem man confluent-hub installiert hat (siehe oben)

```bash
confluent-hub install nishutayal/kafka-connect-hbase:1.0.1
```
https://github.com/tayalnishu/kafka-connect-hbase/blob/master/README.md



## CSV Source
https://rmoff.net/2020/06/17/loading-csv-data-into-kafka/

```
mkdir /tmp/data
mkdir /tmp/data/unprocessed
mkdir /tmp/data/processed
mkdir /tmp/data/error

vi /tmp/data/unprocessed/test.csv 

order_id,customer_id,order_total_usd,make,model,delivery_city,delivery_company,delivery_address
1,535,190899.73,Dodge,Ram Wagon B350,Sheffield,DuBuque LLC,2810 Northland Avenue
2,671,33245.53,Volkswagen,Cabriolet,Edinburgh,Bechtelar-VonRueden,1 Macpherson Crossing
```

### Without any transformation
```bash
confluent local start
kafka-topics --bootstrap-server localhost:9092 --create --replication-factor 1 --partitions 1 --topic connect-test

# muss nur einmalig installiert werden (und habe ich schon am 5.11.2020 gemacht)
~/confluent/confluent-hub/bin/confluent-hub install jcustenborder/kafka-connect-spooldir:2.0.46

# funktioniert nur, wenn schon connet-distributed im Rahmen von `confluent local start` gestartet wurde
curl -i -X PUT -H "Accept:application/json" \
    -H  "Content-Type:application/json" http://localhost:8083/connectors/source-csv-spooldir-00/config \
    -d '{
        "connector.class": "com.github.jcustenborder.kafka.connect.spooldir.SpoolDirCsvSourceConnector",
        "topic": "connect-test",
        "input.path": "/tmp/data/unprocessed",
        "finished.path": "/tmp/data/processed",
        "error.path": "/tmp/data/error",
        "input.file.pattern": ".*\\.csv",
        "schema.generation.enabled":"true",
        "csv.first.row.as.header":"true"
        }'

docker run --tty --network="host" --name kafkacat confluentinc/cp-kafkacat kafkacat -b localhost:9092 -t connect-test -C -J -s key=s -s value=avro -r localhost:8081 | jq '.payload'
docker stop kafkacat
docker rm kafkacat


# andere commands
docker run -it --network="host" --name "kafkacat" confluentinc/cp-kafkacat bash
kafkacat -b localhost:9092 -t test -C

docker run --tty --network="host" --name kafkacat confluentinc/cp-kafkacat kafkacat -b localhost:9092 -L
```


### With transformations using MaskField
https://docs.confluent.io/current/connect/transforms/maskfield.html

vi /tmp/data/unprocessed/test2.csv 

order_id,customer_id,order_total_usd,make,model,delivery_city,delivery_company,delivery_address
3,1337,190899.73,Dodge,Ram Wagon B350,Sheffield,DuBuque LLC,2810 Northland Avenue


```bash
curl -i -X PUT -H "Accept:application/json" \
    -H  "Content-Type:application/json" http://localhost:8083/connectors/source-csv-spooldir-00/config \
    -d '{
        "connector.class": "com.github.jcustenborder.kafka.connect.spooldir.SpoolDirCsvSourceConnector",
        "topic": "connect-test",
        "input.path": "/tmp/data/unprocessed",
        "finished.path": "/tmp/data/processed",
        "error.path": "/tmp/data/error",
        "input.file.pattern": ".*\\.csv",
        "schema.generation.enabled":"true",
        "csv.first.row.as.header":"true",
        "transforms": "MaskField, AddressMask",
        "transforms.MaskField.type": "org.apache.kafka.connect.transforms.MaskField$Value",
        "transforms.MaskField.fields": "model"
        "transforms.AddressMask.type": "org.apache.kafka.connect.transforms.MaskField$Value"
        "transforms.AddressMask.fields": "delivery_address"
        "transforms.AddressMask.replacement": "anonymisedAddress"
        }'
```