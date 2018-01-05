#!/bin/bash

# the default node number is 3
N=${1:-3}

# create network if it doesn't exist
echo "creating docker hadoop network..."
sudo docker network create --driver=bridge hadoop

# start hadoop master container
sudo docker rm -f hadoop-master &> /dev/null
echo "start hadoop-master container..."
echo "DATABASE must be in your local user path: /home/$USER/database/"
sudo docker run -itd \
                -v /home/${USER}/dataset:/root/dataset \
		--net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
		-p 9000:9000 \
                --name hadoop-master \
                --hostname hadoop-master \
                alejandrolr/hadoop-cluster:latest &> /dev/null


# start hadoop slave container
i=1
while [ $i -lt $N ]
do
	sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "start hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                alejandrolr/hadoop-cluster:latest &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
sudo docker exec -it hadoop-master bash
