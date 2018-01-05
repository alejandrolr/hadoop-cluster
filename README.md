# Hadoop-cluster

In order to deploy a hadoop cluster with one master and two slaves execute the following commands:

```
sudo docker pull alejandrolr/hadoop-cluster:latest

git clone https://github.com/alejandrolr/hadoop-cluster.git

cd hadoop-cluster

./start-container.sh
```
It will deploy 3 containers by default.

**NOTE**: You must have the dataset in your local path /home/$USER/dataset/ in order to have the volumes correctly mounted into the master container.
If you want to change the location, edit the file start-container.sh, line:
> -v **/home/${USER}/dataset**:/root/dataset

---
# Preparing the recommender data in HDFS



In the hadoop-master container execute:

```
./start-hadoop.sh
```
and
```
./copy-dataset-to-hdfs.sh
```

And the dataset must be properly mounted into our HDFS system.
