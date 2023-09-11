FROM ubuntu:latest

# Create the coder user
RUN useradd -m -s /bin/bash coder && \
    echo 'coder:codeserver' | chpasswd && \
    usermod -aG sudo coder

RUN echo 'root:codeserver' | chpasswd

# Update packages and install necessary tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    sudo \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Install Java
RUN apt-get update && apt-get install -y \
    openjdk-8-jdk \
    && rm -rf /var/lib/apt/lists/*

# Set Java PATH
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ENV PATH=$JAVA_HOME/bin:$PATH

#Install python
RUN apt-get update && \
    apt-get install -y python3 python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install ipykernel && \
    pip3 install py4j && \
    pip3 install kafka-python

# Install MySQL client
RUN apt-get update && apt-get install -y mysql-client

# Install Node.js (required by Code Server)
RUN curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash - \
    && apt-get install -y nodejs

# Install Visual Studio Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sudo -E bash -

# Install Hadoop
RUN wget https://archive.apache.org/dist/hadoop/common/hadoop-2.8.3/hadoop-2.8.3.tar.gz && \
    tar -xzf hadoop-2.8.3.tar.gz && \
    mv hadoop-2.8.3 /opt/hadoop && \
    rm hadoop-2.8.3.tar.gz

#Install Hbase 
RUN wget https://archive.apache.org/dist/hbase/1.7.2/hbase-1.7.2-bin.tar.gz && \
    tar -xzf hbase-1.7.2-bin.tar.gz && \
    mv hbase-1.7.2 /opt/hbase && \
    rm hbase-1.7.2-bin.tar.gz

#Install zookeeper
RUN wget https://archive.apache.org/dist/zookeeper/zookeeper-3.4.14/zookeeper-3.4.14.tar.gz && \
    tar -xzf zookeeper-3.4.14.tar.gz && \
    mv zookeeper-3.4.14 /opt/zookeeper && \
    rm zookeeper-3.4.14.tar.gz

#Install hive
RUN wget https://archive.apache.org/dist/hive/hive-2.3.5/apache-hive-2.3.5-bin.tar.gz && \
    tar -xzf apache-hive-2.3.5-bin.tar.gz && \
    mv apache-hive-2.3.5-bin /opt/hive && \
    rm apache-hive-2.3.5-bin.tar.gz

# Install Spark
RUN wget https://dlcdn.apache.org/spark/spark-3.4.0/spark-3.4.0-bin-hadoop3.tgz && \
    tar -xzf spark-3.4.0-bin-hadoop3.tgz && \
    mv spark-3.4.0-bin-hadoop3 /opt/spark && \
    rm spark-3.4.0-bin-hadoop3.tgz

# Install sqoop
RUN wget https://archive.apache.org/dist/sqoop/1.4.6/sqoop-1.4.6.bin__hadoop-0.23.tar.gz && \
    tar -xzf sqoop-1.4.6.bin__hadoop-0.23.tar.gz && \
    mv sqoop-1.4.6.bin__hadoop-0.23 /opt/sqoop && \
    rm sqoop-1.4.6.bin__hadoop-0.23.tar.gz

#Install kafka
RUN wget https://archive.apache.org/dist/kafka/2.1.0/kafka_2.11-2.1.0.tgz && \
    tar -xvf kafka_2.11-2.1.0.tgz && \
    mv kafka_2.11-2.1.0 /opt/kafka && \
    rm kafka_2.11-2.1.0.tgz

#Install flume
RUN wget https://archive.apache.org/dist/flume/1.9.0/apache-flume-1.9.0-bin.tar.gz && \
    tar -xzf apache-flume-1.9.0-bin.tar.gz && \
    mv apache-flume-1.9.0-bin /opt/flume && \
    rm apache-flume-1.9.0-bin.tar.gz

#mysql connector
RUN wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.26/mysql-connector-java-8.0.26.jar && \
    cp mysql-connector-java-8.0.26.jar /opt/hive/lib && \
    cp mysql-connector-java-8.0.26.jar /opt/spark/jars && \
    cp mysql-connector-java-8.0.26.jar /opt/sqoop/lib && \
    rm mysql-connector-java-8.0.26.jar

#Removing jar
RUN rm /opt/hbase/lib/slf4j-log4j12-1.7.25.jar
RUN rm /opt/hive/lib/log4j-slf4j-impl-2.6.2.jar
RUN rm /opt/hive/lib/guava-14.0.1.jar
RUN cp /opt/hadoop/share/hadoop/hdfs/lib/guava-11.0.2.jar /opt/hive/lib/

#Set environment for the "coder" user
ENV HOME=/home/coder

# Set environment variables for Hadoop
ENV HADOOP_HOME=/opt/hadoop
ENV HADOOP_INSTALL=$HADOOP_HOME
ENV HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_HDFS_HOME=$HADOOP_HOME
ENV YARN_HOME=$HADOOP_HOME
ENV PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin

#set environment variables for Hbase
ENV HBASE_HOME=/opt/hbase
ENV PATH=$PATH:$HBASE_HOME/bin

#Set environment variables for Zookeeper
ENV ZOOKEEPER_HOME=/opt/zookeeper
ENV PATH=$PATH:$ZOOKEEPER_HOME/bin

#set environment variables for hive
ENV HIVE_HOME=/opt/hive
ENV PATH=$PATH:$HIVE_HOME/bin

#Set environment variables for Spark
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin

#Set environment variables for Sqoop
ENV SQOOP_HOME=/opt/sqoop
ENV SQOOP_CLASSPATH=$SQOOP_HOME/lib
ENV PATH=$PATH:$SQOOP_HOME/bin

#Set environment variables for Kafka
ENV KAFKA_HOME=/opt/kafka
ENV PATH=$PATH:$KAFKA_HOME/bin

#Set environment variables for Flume
ENV FLUME_HOME=/opt/flume
ENV PATH=$PATH:$FLUME_HOME/bin

#Set environment variable for python-jupyter-pyspark
ENV PYTHONPATH=$PYTHONPATH:$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.x-src.zip

# Copy Hadoop configuration files
COPY ./configs/core-site.xml $HADOOP_CONF_DIR/core-site.xml
COPY ./configs/hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml
COPY ./configs/mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml
COPY ./configs/yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml
COPY ./configs/hadoop-env.sh $HADOOP_CONF_DIR/hadoop-env.sh


#copy hbase configuration files
COPY ./configs/hbase-site.xml $HBASE_HOME/conf
COPY ./configs/hbase-env.sh $HBASE_HOME/conf

#copy zookeeper configuration files
COPY ./configs/zoo.cfg $ZOOKEEPER_HOME/conf

#copy hive configuration files
COPY ./configs/hive-env.sh $HIVE_HOME/conf
COPY ./configs/hive-site.xml $HIVE_HOME/conf

# copy sqoop configuration files
COPY ./configs/sqoop-env.sh $SQOOP_HOME/conf/sqoop-env.sh
COPY ./configs/sqoop-site.xml $SQOOP_HOME/conf/sqoop-site.xml

#copy flume configuration files
COPY ./configs/flume-env.sh $FLUME_HOME/conf

#copy kafka configuraton files
COPY ./configs/server.properties /opt/kafka/config/server.properties

#permission for hadoop logs
RUN mkdir -p /opt/hadoop/logs && \
    sudo chown -R coder:coder /opt/hadoop && \
    sudo chmod -R 777 /opt/hadoop/logs

#permission for hbase logs
RUN sudo chown -R coder:coder /opt/hbase && \
    sudo chmod 777 /opt/hbase

#permission for zookeeper logs
RUN sudo chown -R coder:coder /opt/zookeeper && \
    sudo chmod 777 /opt/zookeeper

#permission for kafka
RUN sudo chown -R coder:coder /opt/kafka && \
    sudo chmod 777 /opt/kafka

WORKDIR /home/coder



# Extension and configuration files  
COPY ./configs/config.yaml /home/coder/.config/code-server/config.yaml
COPY ./extensions /home/coder/.config/

# Copy the startup script into the container
COPY startup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/startup.sh

USER coder

# Create the workspace directory
RUN mkdir -p /home/coder/project    

ENTRYPOINT ["bash", "-c", "/usr/local/bin/startup.sh"]