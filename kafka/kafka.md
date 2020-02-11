# Installation and Starting Apache Kafka
https://kafka.apache.org/quickstart


# Start Kafka
cd /home/michael/kafka/current
> bin/zookeeper-server-start.sh config/zookeeper.properties
> bin/kafka-server-start.sh config/server.properties

# Kafka topic admin
./kafka/current/bin/kafka-topics.sh --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic testingKafkaProducer
./kafka/current/bin/kafka-topics.sh --list --bootstrap-server localhost:9092