#!/bin/bash

# Format Namenode
$HADOOP_HOME/bin/hdfs namenode -format

# Start NameNode
$HADOOP_HOME/sbin/hadoop-daemon.sh start namenode

# Start DataNode
$HADOOP_HOME/sbin/hadoop-daemon.sh start datanode

# Start ResourceManager
$HADOOP_HOME/sbin/yarn-daemon.sh start resourcemanager

# Start NodeManager
$HADOOP_HOME/sbin/yarn-daemon.sh start nodemanager

mysql -h mysql -u root -prootpassword << EOF
GRANT ALL PRIVILEGES ON *.* TO 'coder'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# hive
$HADOOP_HOME/bin/hadoop fs -mkdir -p /user/hive/warehouse
$HADOOP_HOME/bin/hadoop fs -chmod 777 /user/hive/warehouse
$HADOOP_HOME/bin/hadoop fs -mkdir -p /tmp
$HADOOP_HOME/bin/hadoop fs -chmod 777 /tmp

#hive schema
schematool -initSchema -dbType mysql

#zookeeper
zkServer.sh start

#Start Hbase
$HBASE_HOME/bin/start-hbase.sh

# Start code-server
code-server --bind-addr 0.0.0.0:8080 --auth none /home/coder/project 



