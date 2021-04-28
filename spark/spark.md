##############################################
## install scala
##############################################
# https://medium.com/@josemarcialportilla/installing-scala-and-spark-on-ubuntu-5665ee4b62b1
sudo apt-get -y install scala
scala -version

# After installation according to official Spark website
Download file
tar zxvf spark-3.1.1-bin-hadoop3.2.tgz
sudo ln -s spark-3.1.1-bin-hadoop3.2 current

# In /home/michael/.bashrc hinzufügen
```shell
export SPARK_HOME="/home/michael/spark/current"
export PATH=$PATH:$SPARK_HOME/bin
```





# Example
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