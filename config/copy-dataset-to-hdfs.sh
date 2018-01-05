#!/bin/bash

echo "run first ./start-hadoop.sh"

# create dataset directory on HDFS
hadoop fs -mkdir -p hdfs://hadoop-master:9000/dataset/

# put dataset files to HDFS
hdfs dfs -put ./dataset/* hdfs://hadoop-master:9000/dataset/
