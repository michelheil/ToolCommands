# Installation and Starting Apache Kafka
https://kafka.apache.org/quickstart


# Start Kafka
cd /home/michael/kafka/current
* bin/zookeeper-server-start.sh config/zookeeper.properties
* bin/kafka-server-start.sh config/server.properties

# Kafka topic admin
> ./kafka/current/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic testingKafkaProducer

> ./kafka/current/bin/kafka-topics.sh --list --bootstrap-server localhost:9092

> ./kafka/current/bin/kafka-topics.sh --describe --bootstrap-server localhost:9092 --topic test

# Kafka Console Producer
> ./kafka/current/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test --property "parse.key=true" 
  --property "key.separator=:::"

# Kafka Console Consumer
> ./kafka/current/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning --property print.key=true --property print.value=true

# Console Consumer from particular offset
```bash
./kafka/current/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --partition 0 --offset 1
```

# Check Consumer Groups
> ./kafka/current/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
```shell
spark-kafka-source-b89fd278-521b-485d-9df9-d4a69895ccd2-636459464-driver-0
console-consumer-72987
```
> ./kafka/current/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group "spark-kafka-source-b89fd278-521b-485d-9df9-d4a69895ccd2-636459464-driver-0"


# Stop Kafka
cd /home/michael/kafka/current
* bin/zookeeper-server-stop.sh
* bin/kafka-server-stop.sh
