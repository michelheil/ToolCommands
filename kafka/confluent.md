# Install Confluent Community
https://docs.confluent.io/current/installation/installing_cp/zip-tar.html

```bash
curl -O http://packages.confluent.io/archive/5.5/confluent-community-5.5.0-2.11.tar.gz
tar xzf confluent-community-5.5.0-2.11.tar.gz
```

## Set environment variables
```bash
export CONFLUENT_HOME=/home/michael/confluent/confluent-5.5.0
export PATH=$PATH:$CONFLUENT_HOME/bin
```

## Install Confluent CLI
https://docs.confluent.io/current/quickstart/ce-quickstart.html
https://docs.confluent.io/current/cli/command-reference/index.html#cli-command-reference

```bash
curl -L --http1.1 https://cnfl.io/cli | sh -s -- -b /<path-to-cli>
```

## Install Confluent-Hub
https://docs.confluent.io/current/connect/managing/confluent-hub/client.html#confluent-hub-client

## Start Entire Confluent Platform
```bash
confluent local start
```

## Start Zookeeper, Kafka and Schema Registry
```bash
zookeeper-server-start ~/confluent/confluent-5.5.0/etc/kafka/zookeeper.properties
kafka-server-start ~/confluent/confluent-5.5.0/etc/kafka/server.properties
schema-registry-start ~/confluent/confluent-5.5.0/etc/schema-registry/schema-registry.properties
```

## Start Connect, REST Proxy, and ksqlDB
```bash
connect-distributed ~/confluent/confluent-5.5.0/etc/schema-registry/connect-avro-distributed.properties
kafka-rest-start ~/confluent/confluent-5.5.0/etc/kafka-rest/kafka-rest.properties
ksql-server-start ~/confluent/confluent-5.5.0/etc/ksqldb/ksql-server.properties
```

## Create Topic
```bash
cd ~/confluent/confluent-5.5.0/bin
kafka-topics --bootstrap-server localhost:9092 --create --replication-factor 1 --partitions 1 --topic test

--config confluent.value.schema.validation=true
```

## Console Producer
```bash
kafka-console-producer --broker-list localhost:9092 --topic test --property "parse.key=true" --property "key.separator=:::"
```

## Console Consumer
```bash
kafka-console-consumer --bootstrap-server localhost:9092 --from-beginning --property print.key=true --property print.value=true --topic test

--value-deserializer org.apache.kafka.common.serialization.LongDeserializer
```

### Console Consumer (read only committed transactional data)
```bash
kafka-console-consumer --bootstrap-server localhost:9092 --topic hello-world-topic --from-beginning --property print.key=true --property print.value=true --isolation.level=read_committed
```

# Check Consumer Groups
```bash
kafka-consumer-groups --bootstrap-server localhost:9092 --list
```

## Console AVRO Consumer
### When only value is serialzed as key but you only want to print out value (and not key)
```bash
kafka-avro-console-consumer \
  --bootstrap-server localhost:9092 \
  --from-beginning \
  --topic avrotest \
  --property schema.registry.url=http://localhost:8081
```

### When only value is serialized as AVRO but you also want to print.key=true

### Get content of schema-id in Schema Registry
```bash
curl --silent -X GET http://localhost:8081/schemas/ids/1 | jq .
```

```bash
kafka-avro-console-consumer \
  --bootstrap-server localhost:9092 \
  --from-beginning \
  --topic avrotest --property print.key=true \
  --property schema.registry.url=http://localhost:8081 \
  --property value.schema="$(curl http://localhost:8081/schemas/ids/1 | jq -r .schema)"
```




### Create Topic through REST API v3
First figure out the cluster-id

```bash
curl -X GET -H "Accept: application/vnd.api+json" localhost:8082/v3/clusters
```

Replace `dW5WkttLTmeDAFUsRFUfPA` with cluster-id resulted from code above

```bash
curl -X POST -H "Content-Type: application/vnd.api+json" -H "Accept: application/vnd.api+json" \
          --data '{"data":{"attributes": {"topic_name": "topic-1", "partitions_count": 2, "replication_factor": 1, "configs": [{"name": "cleanup.policy","value": "compact"}]}}}' \
          "http://localhost:8082/v3/clusters/dW5WkttLTmeDAFUsRFUfPA/topics"
```


#### List the topics belonging to a given cluster
GET /v3/clusters/(string: cluster_id)/topics

```bash
curl -X GET -H "Accept: application/vnd.api+json" localhost:8082/v3/clusters/fSe8TRhJSruY4UzPBYm4tA/topics 
```


#### List all topics (Rest API V2)
```bash
curl -X GET -H "Accept: application/vnd.kafka.v2+json" localhost:8082/topics 
```


GET /topics HTTP/1.1
Host: kafkaproxy.example.com
Accept: application/vnd.kafka.v2+json





# Kafka Connect Example
https://docs.confluent.io/current/connect/userguide.html

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


# KSQL
```bash
confluent local start
bash ~/confluent/confluent-5.5.0/bin/ksql
```

Die Nachrichten müssen als CSV, JSON oder AVRO serialisiert sein und deren Schema in der SchemaRegistry registriert sein.
