##############################################
## install scala
##############################################
# https://medium.com/@josemarcialportilla/installing-scala-and-spark-on-ubuntu-5665ee4b62b1
sudo apt-get -y install scala
scala -version


```shell
export SPARK_HOME="/home/michael/spark/current"
export PATH=$PATH:$SPARK_HOME/bin
```


./bin/spark-shell --packages org.apache.spark:spark-sql-kafka-0-10_2.11:2.4.0

```scala
spark.sparkContext.setLogLevel("WARN")

val df = spark.readStream
  .format("kafka")
  .option("kafka.bootstrap.servers", "localhost:9092")
  .option("subscribe", "sparkShellIn")
  .option("failOnDataLoss", "false") // in case offsets or entire topic are getting deleted
  .load()

df.writeStream
    .format("console")
    .outputMode("update")
    .option("checkpointLocation", "/home/michael/sparkCheckpoint/")
    .start()

spark.streams.awaitAnyTermination()
```



kafka-console-producer --broker-list localhost:9092 --topic sparkShellIn --property "parse.key=true" --property "key.separator=:::"
