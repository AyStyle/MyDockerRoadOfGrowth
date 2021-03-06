FROM busybox AS busybox
FROM openjdk:8 AS jdk

ENV KAFKA_HOME=/usr/local/kafka_2.12-2.7.0
WORKDIR ${KAFKA_HOME}

COPY --from=busybox /bin /bin
ADD kafka_2.12-2.7.0.tgz /usr/local/
COPY kafka-cluster-start.sh ${KAFKA_HOME}/bin

# 环境变量配置
ENV PATH="${PATH}:${KAFKA_HOME}/bin"

# server.properties 配置
# Zookeeper启动容器的时候必须配置，不然kafka启动不起来
ENV SERVER_ZOOKEEPER_CONNECT=""
ENV SERVER_NUM_NETWORK_THREADS=3
ENV SERVER_NUM_IO_THREADS=8
ENV SERVER_SOCKET_SEND_BUFFER_BYTES=102400
ENV SERVER_SOCKET_RECEIVE_BUFFER_BYTES=102400
ENV SERVER_SOCKET_REQUEST_MAX_BYTES=104857600
ENV SERVER_LOG_DIRS=${KAFKA_HOME}/logs
ENV SERVER_NUM_PARTITIONS=1
ENV SERVER_NUM_RECOVERY_THREADS_PER_DATA_DIR=1
ENV SERVER_OFFSETS_TOPIC_REPLICATION_FACTOR=1
ENV SERVER_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1
ENV SERVER_TRANSACTION_STATE_LOG_MIN_ISR=1
ENV SERVER_LOG_FLUSH_INTERVAL_MESSAGES=10000
ENV SERVER_LOG_FLUSH_INTERVAL_MS=1000
ENV SERVER_LOG_RETENTION_HOURS=72
ENV SERVER_LOG_RETENTION_BYTES=1073741824
ENV SERVER_LOG_SEGMENT_BYTES=1073741824
ENV SERVER_LOG_RETENTION_CHECK_INTERVAL_MS=300000
ENV SERVER_ZOOKEEPER_CONNECTION_TIMEOUT_MS=18000
ENV SERVER_GROUP_INITIAL_REBALANCE_DELAY_MS=0

ENTRYPOINT ["/usr/local/kafka_2.12-2.7.0/bin/kafka-cluster-start.sh"]

