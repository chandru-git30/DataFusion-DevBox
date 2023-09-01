# DataFusion-DevBox 🚀✨
"Embark on Big Data Adventures with DataFusion-DevBox!Your All-in-One Docker Journey into Java, Python, Spark, Hadoop,  SparkSQL, Hive, HBase, MySQL, Sqoop, Kafka, Flume with Jupyter Extensions in codeserver. Elevate Your Big Data Projects - Unleash the Magic!"

## DataFusion DevBox: Quick Start Guide 🚀🎉
Welcome to the DataFusion DevBox repository! This guide will help you get started with your all-in-one Docker environment for big data development. Follow these steps to unleash the power of various technologies like Java, Python, Spark, and more.

## Prerequisites 🛠️
Before you begin, make sure you have the following installed on your system:

- Docker: https://docs.docker.com/get-docker/ 🐳
- Docker Compose:https://docs.docker.com/compose/install/ 🛳️
- Git: https://git-scm.com/downloads 📦

## Getting Started

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/chandru-git30/DataFusion-DevBox.git
   cd DataFusion_DevBox/DevBox
   ```
2. **Run the Docker Container:**
   ```bash
   docker-compose up
   ```
3. **Go to Browser:**
   ```bash
   http://localhost:8080
   ```
## Included Technologies
- Java
- Python
- Hadoop
- Hbase
- Hive
- Sqoop
- Mysql
- Spark
- Kafka
- Flume
- Zookeeper
- Jupyter Extensions

## Tips and Notes
- You can customize the Docker image by modifying the Dockerfile.
- Make sure to stop and remove the container when you need to recompose the image:
```bash
docker stop <your_devbox_instance>
docker rm <your_devbox_instance>
```
- Explore and experiment with the different technologies to supercharge your big data projects!

## Working
- Once you composed the docker and executed port 8080 you will prompt to a code server like this

![1](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/f467caf1-a596-4e9d-a032-59f177d0ecb2)

- Execute jps in terminal to get the name of the started daemons

![2](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/56d858e0-1a8a-4ece-9e3b-fcd2a80ec095)
 
- Get python interactive mode by executing <python> in terminal

![3](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/e3c61e38-a81c-40d3-9cfa-43f840e4f1ef)

- Check the version of java by executing <java -version> in terminal
  
![4](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/593cb7c8-d4ef-4638-bcf6-1176c24d3d8e)

- Check the version of hadoop by executing <hadoop version> in terminal

![5](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/b70265a5-459e-46a9-9d44-95982ab7484b)

- Check the version of sqoop by executing <sqoop version> in terminal

![6](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/fd254c2c-3a83-4e15-a2cf-1d6565ceaf13)

- Check the version of hbase by executing <hbasae version> in terminal

![7](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/2a47a7f3-c67a-468b-994a-d1bb2ca2f428)

- Check the version of hive by executing <hive --version> in terminal

![8](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/97fe2081-bab4-4742-bdb7-2e8c8a226a16)

- Execute <mysql -h mysql -u coder -pcoderpassword> to access mysql database

![9](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/4354a24d-322f-4a31-af11-21fb107dc31a)

- Mysql is used to store metadata of hive and in this case metastore database is created to do it
  
![10](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/01e7e1b3-ddbb-41eb-b620-3c0a32ebf22d)

- You can start kafka with <kafka-server-start.sh /opt/kafka/config/server.properties>

![11](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/e939b416-d221-439e-b546-ffb1419ce8ed)

- You can check the kafka daemon is started or not by exexuting <jps> in terminal

![12](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/b3214b95-f12b-4db9-9606-fcf0c693d08e)

- Check the version of flume by executing <flume-ng version>

![13](https://github.com/chandru-git30/DataFusion-DevBox/assets/82560086/787c753b-a353-4d5a-bd88-f2f8c6d985da)

