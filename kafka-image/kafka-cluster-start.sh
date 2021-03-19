#!/bin/bash

# 建立broker日志目录
mkdir -p ${SERVER_LOG_DIRS}/broker0
mkdir -p ${SERVER_LOG_DIRS}/broker1
mkdir -p ${SERVER_LOG_DIRS}/broker2

# ZOOKEEPER 必须配置
if [ -z ${SERVER_ZOOKEEPER_CONNECT} ] 
then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - ENV SERVER_ZOOKEEPER_CONNECT is not configured."
    echo "$(date +'%Y-%m-%d %H:%M:%S') - ENV SERVER_ZOOKEEPER_CONNECT is not configured." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log
    exit 1
fi

# broker0 配置
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker0 start..." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log && \
kafka-server-start.sh -daemon ${KAFKA_HOME}/config/server.properties \
    --override broker.id=0 \
    --override listeners=PLAINTEXT://127.0.0.1:9092 \
    --override num.network.threads=${SERVER_NUM_NETWORK_THREADS} \
    --override num.io.threads=${SERVER_NUM_IO_THREADS} \
    --override socket.send.buffer.bytes=${SERVER_SOCKET_SEND_BUFFER_BYTES} \
    --override socket.receive.buffer.bytes=${SERVER_SOCKET_RECEIVE_BUFFER_BYTES} \
    --override socket.request.max.bytes=${SERVER_SOCKET_REQUEST_MAX_BYTES} \
    --override log.dirs=${SERVER_LOG_DIRS}/broker0 \
    --override num.partitions=${SERVER_NUM_PARTITIONS} \
    --override num.recovery.threads.per.data.dir=${SERVER_NUM_RECOVERY_THREADS_PER_DATA_DIR} \
    --override offsets.topic.replication.factor=${SERVER_OFFSETS_TOPIC_REPLICATION_FACTOR} \
    --override transaction.state.log.replication.factor=${SERVER_TRANSACTION_STATE_LOG_REPLICATION_FACTOR} \
    --override transaction.state.log.min.isr=${SERVER_TRANSACTION_STATE_LOG_MIN_ISR} \
    --override log.flush.interval.messages=${SERVER_LOG_FLUSH_INTERVAL_MESSAGES} \
    --override log.flush.interval.ms=${SERVER_LOG_FLUSH_INTERVAL_MS} \
    --override log.retention.hours=${SERVER_LOG_RETENTION_HOURS} \
    --override log.retention.bytes=${SERVER_LOG_RETENTION_BYTES} \
    --override log.segment.bytes=${SERVER_LOG_SEGMENT_BYTES} \
    --override log.retention.check.interval.ms=${SERVER_LOG_RETENTION_CHECK_INTERVAL_MS} \
    --override zookeeper.connect=${SERVER_ZOOKEEPER_CONNECT} \
    --override zookeeper.connection.timeout.ms=${SERVER_ZOOKEEPER_CONNECTION_TIMEOUT_MS} \
    --override group.initial.rebalance.delay.ms=${SERVER_GROUP_INITIAL_REBALANCE_DELAY_MS} && \
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker0 start success." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log || \
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker0 start failed." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log

# broker1 配置
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker1 start..." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log && \
kafka-server-start.sh -daemon ${KAFKA_HOME}/config/server.properties \
    --override broker.id=1 \
    --override listeners=PLAINTEXT://127.0.0.1:9093 \
    --override num.network.threads=${SERVER_NUM_NETWORK_THREADS} \
    --override num.io.threads=${SERVER_NUM_IO_THREADS} \
    --override socket.send.buffer.bytes=${SERVER_SOCKET_SEND_BUFFER_BYTES} \
    --override socket.receive.buffer.bytes=${SERVER_SOCKET_RECEIVE_BUFFER_BYTES} \
    --override socket.request.max.bytes=${SERVER_SOCKET_REQUEST_MAX_BYTES} \
    --override log.dirs=${SERVER_LOG_DIRS}/broker1 \
    --override num.partitions=${SERVER_NUM_PARTITIONS} \
    --override num.recovery.threads.per.data.dir=${SERVER_NUM_RECOVERY_THREADS_PER_DATA_DIR} \
    --override offsets.topic.replication.factor=${SERVER_OFFSETS_TOPIC_REPLICATION_FACTOR} \
    --override transaction.state.log.replication.factor=${SERVER_TRANSACTION_STATE_LOG_REPLICATION_FACTOR} \
    --override transaction.state.log.min.isr=${SERVER_TRANSACTION_STATE_LOG_MIN_ISR} \
    --override log.flush.interval.messages=${SERVER_LOG_FLUSH_INTERVAL_MESSAGES} \
    --override log.flush.interval.ms=${SERVER_LOG_FLUSH_INTERVAL_MS} \
    --override log.retention.hours=${SERVER_LOG_RETENTION_HOURS} \
    --override log.retention.bytes=${SERVER_LOG_RETENTION_BYTES} \
    --override log.segment.bytes=${SERVER_LOG_SEGMENT_BYTES} \
    --override log.retention.check.interval.ms=${SERVER_LOG_RETENTION_CHECK_INTERVAL_MS} \
    --override zookeeper.connect=${SERVER_ZOOKEEPER_CONNECT} \
    --override zookeeper.connection.timeout.ms=${SERVER_ZOOKEEPER_CONNECTION_TIMEOUT_MS} \
    --override group.initial.rebalance.delay.ms=${SERVER_GROUP_INITIAL_REBALANCE_DELAY_MS} && \
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker1 start success." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log || \
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker1 start failed." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log

# broker2 配置
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker2 start..." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log && \
kafka-server-start.sh -daemon ${KAFKA_HOME}/config/server.properties \
    --override broker.id=2 \
    --override listeners=PLAINTEXT://127.0.0.1:9094 \
    --override num.network.threads=${SERVER_NUM_NETWORK_THREADS} \
    --override num.io.threads=${SERVER_NUM_IO_THREADS} \
    --override socket.send.buffer.bytes=${SERVER_SOCKET_SEND_BUFFER_BYTES} \
    --override socket.receive.buffer.bytes=${SERVER_SOCKET_RECEIVE_BUFFER_BYTES} \
    --override socket.request.max.bytes=${SERVER_SOCKET_REQUEST_MAX_BYTES} \
    --override log.dirs=${SERVER_LOG_DIRS}/broker2 \
    --override num.partitions=${SERVER_NUM_PARTITIONS} \
    --override num.recovery.threads.per.data.dir=${SERVER_NUM_RECOVERY_THREADS_PER_DATA_DIR} \
    --override offsets.topic.replication.factor=${SERVER_OFFSETS_TOPIC_REPLICATION_FACTOR} \
    --override transaction.state.log.replication.factor=${SERVER_TRANSACTION_STATE_LOG_REPLICATION_FACTOR} \
    --override transaction.state.log.min.isr=${SERVER_TRANSACTION_STATE_LOG_MIN_ISR} \
    --override log.flush.interval.messages=${SERVER_LOG_FLUSH_INTERVAL_MESSAGES} \
    --override log.flush.interval.ms=${SERVER_LOG_FLUSH_INTERVAL_MS} \
    --override log.retention.hours=${SERVER_LOG_RETENTION_HOURS} \
    --override log.retention.bytes=${SERVER_LOG_RETENTION_BYTES} \
    --override log.segment.bytes=${SERVER_LOG_SEGMENT_BYTES} \
    --override log.retention.check.interval.ms=${SERVER_LOG_RETENTION_CHECK_INTERVAL_MS} \
    --override zookeeper.connect=${SERVER_ZOOKEEPER_CONNECT} \
    --override zookeeper.connection.timeout.ms=${SERVER_ZOOKEEPER_CONNECTION_TIMEOUT_MS} \
    --override group.initial.rebalance.delay.ms=${SERVER_GROUP_INITIAL_REBALANCE_DELAY_MS} && \
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker2 start success." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log || \
echo "$(date +'%Y-%m-%d %H:%M:%S') - kafka broker2 start failed." >> ${SERVER_LOG_DIRS}/kafka-cluster-start.log

# 防止镜像退出，当Kafka进程全部退出后程序才会自动退出
while [[ -n $(jps | grep Kafka | awk '{print $1}') ]]
do
    sleep 3
done