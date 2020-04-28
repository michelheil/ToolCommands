Confluent.md

# Install
https://docs.confluent.io/current/installation/installing_cp/zip-tar.html

```bash
curl -O http://packages.confluent.io/archive/5.5/confluent-community-5.5.0-2.11.tar.gz
tar xzf confluent-community-5.5.0-2.11.tar.gz
```

# Start Zookeeper, Kafka and Schema Registry
```bash
cd ~/confluent/confluent-5.5.0
bash bin/zookeeper-server-start ~/confluent/confluent-5.5.0/etc/kafka/zookeeper.properties
bash bin/kafka-server-start ~/confluent/confluent-5.5.0/etc/kafka/server.properties
bash bin/schema-registry-start ~/confluent/confluent-5.5.0/etc/schema-registry/schema-registry.properties
```

# Start REST Proxy ksqlDB
```bash
bash bin/kafka-rest-start ~/confluent/confluent-5.5.0/etc/kafka-rest/kafka-rest.properties
bash bin/ksql-server-start ~/confluent/confluent-5.5.0/etc/ksqldb/ksql-server.properties
```

# Create Topic
```bash
./bin/kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic hello-world-topic
```

# Console Consumer
```bash
./bin/kafka-console-consumer --bootstrap-server localhost:9092 --topic hello-world-topic --from-beginning --property print.key=true --property print.value=true
```

curl -X GET -H "Accept: application/vnd.kafka.v2+json" localhost:8082/topics


## Create Topic through REST API v3
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











