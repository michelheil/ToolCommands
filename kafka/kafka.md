# Installation and Starting Apache Kafka
https://kafka.apache.org/quickstart


# Start Kafka
```bash
cd /home/michael/kafka/current
bash bin/zookeeper-server-start.sh config/zookeeper.properties
bash bin/kafka-server-start.sh config/server.properties
```

# Kafka topic admin
```bash
./kafka/current/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 4 --topic myInputTopic
./kafka/current/bin/kafka-topics.sh --list --bootstrap-server localhost:9092
./kafka/current/bin/kafka-topics.sh --describe --bootstrap-server localhost:9092 --topic test
```

# Kafka Console Producer
```bash
./kafka/current/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic myInputTopic --property "parse.key=true" --property "key.separator=:::"
```

# Kafka Console Consumer
```bash
./kafka/current/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic myOutputTopic --from-beginning --property print.key=true --property print.value=true
```

# Console Consumer from particular offset
```bash
./kafka/current/bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --partition 0 --offset 1
```

# Check Consumer Groups
```bash
./kafka/current/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list

> spark-kafka-source-b89fd278-521b-485d-9df9-d4a69895ccd2-636459464-driver-0
> console-consumer-72987

./kafka/current/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group "spark-kafka-source-b89fd278-521b-485d-9df9-d4a69895ccd2-636459464-driver-0"
```

## Change offsets for consumer Group
With a `-5` in parameter `--shift-by` you substract 5 from current offset. The option `--execute` actually exectues the change, whereas you can use `--dry-run` to see what is hapenning. In order to change offsets for a Consumer Group it need to be inactive, i.e. not running.
```shell
./kafka/current/bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --group "CheckpointGroupId1337" --reset-offsets --topic "myTestTopicCheck:0" --shift-by -5 --execute
```


# Stop Kafka
cd /home/michael/kafka/current
* bin/zookeeper-server-stop.sh
* bin/kafka-server-stop.sh
