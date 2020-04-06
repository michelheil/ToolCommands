# References
https://docs.confluent.io/current/app-development/kafkacat-usage.html

https://github.com/edenhill/kafkacat

# Basic Examples
### Basic producer
b is broker, t is topic, `-P` stand for producing.
```
kafkacat -b localhost:9092 -t new_topic -P
```

### Produce data from a file
`-l` is required to send file content line-by-line instead of entire file as one (binary) message. 
```
kafkacat -b localhost:9092 -t new_topic -P -l /tmp/msgs
```



### Producing data multiple times from the same file
```shell script
#!/usr/bin/env bash

iterator=1
KAFKA_TOPIC="myInputTopic"
TEST_DATA_PATH="../../sparkTheDefinitiveGuide/data/activity-data/"
TEST_DATA_FILE="part-00000-tid-730451297822678341-1dda7027-2071-4d73-a0e2-7fb6a91e1d1f-0-c000.json"

while [ $iterator -le 1 ]
do
  kafkacat -b localhost:9092 -t test -P -l ${TEST_DATA_PATH}${TEST_DATA_FILE}
  echo $iterator
  ((iterator++))
done
```

### Producing data from all json files within a given directory
```shell script
KAFKA_TOPIC=($(grep kafka.input.topic ../conf/kafka.conf | cut -d "=" -f2))
TEST_DATA_PATH="../../sparkTheDefinitiveGuide/data/activity-data/"

for filename in ${TEST_DATA_PATH}*.json; do
  echo "Producing data of file: ${filename}"
  kafkacat -b localhost:9092 -t ${KAFKA_TOPIC} -P -l ${filename}
done
```