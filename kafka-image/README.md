### 第一步：下载kafka压缩文件
参考：[kafka-download](https://www.apache.org/dyn/closer.cgi?path=/kafka/2.7.0/kafka_2.12-2.7.0.tgz)

### 第二步：编写docker镜像文件
```
说明：
1. busybox提供了linux命令行功能。
2. kafka-cluster-start.sh请参考第三步。
3. server.properties全部配置到环境变量中，并用SERVER开头拼接server.properties里的属性，例如：zookeeper.connect => SERVER_ZOOKEEPER_CONNECT；
   SERVER_ZOOKEEPER_CONNECT编写镜像的时候配置为空，当启动kafka的时候再指定zookeeper连接；  
   broker.id和 listeners不在环境变量里配置。
```
参考：[Dockerfile](Dockerfile)

### 第三步：编写kafka集群启动shell脚本：kafka-cluster-start.sh
```
注意：
   1. 在win环境下编写的shell一定要在notepad++上将换行符\n\r替换为\n，否则docker容器不能正确执行启动脚本
   2. 配置每个broker的id和listener
```
参考：[kafka-cluster-start.sh](kafka-cluster-start.sh)

### 第四步：构建镜像并上传镜像到仓库
```
注意：此时kafka的下载文件、kafka-cluster-start.sh和Dockerfile在同一个目录下
docker image build -t dreedisgood/kafka:2.12-2.7.0 .
docker image push dreedisgood/kafka:2.12-2.7.0
```

### 第五步：启动kafka伪分布式容器
```
docker container run -d --name local_kafka -e SERVER_ZOOKEEPER_CONNECT=<这里写Zookeeper地址，必填参数> -p 9092:9092 dreedisgood/kafka:2.12-2.7.0 
```





