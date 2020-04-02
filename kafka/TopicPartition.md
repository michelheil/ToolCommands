```scala
val startingOffset = new mutable.HashMap[TopicPartition, scala.Long]()
startingOffset.put(new TopicPartition("myTopic", 0), startingOffset.toLong)

val ssc = new StreamingContext(sparkSession.sparkContext, Seconds(5L))
val stream: InputDStream[ConsumerRecord[String, String]] = KafkaUtils.createDirectStream[String, String](ssc, PreferConsistent, Subscribe[String, String]("myTopic", kafkaParams, startingOffset))
```
