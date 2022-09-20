kubectl -n kafka exec -ti kafka-cluster -- ./bin/kafka-topics.sh --bootstrap-server kafka-cluster-kafka-bootstrap:9092 --topic logs --alter --partitions 5 --replication-factor 2

