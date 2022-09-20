1. Kafka
Send message to kafka topic called 'logs' a json message.

Kafka producer:
invoke-kafka-logs-producer.sh

Example message:
A. {"name":"Cristiano", "age":37, "car":"Ferrari"}
B. {"al_log_timestamp": 1663655923915000,"al_log_severity": 0,"al_log_timestamp_origin": 1663655923915000,"al_log_value": "TEST4 This is one line from the log, maybe contains word error.","al_log_type": "logMsg","al_log_subtype": "logMsg_1","al_log_name": "mda-logs"}

Kibana query: al_log_value : TEST3

2. Logstash
Logstash fetches the message from the kafka and sends to Elastisearch.

3. Elasticsearch
Elasticsearch has defined policy and index template.
An mda-logs-YYYY-MM-DD daily index is created when new messages appear.

4. Kibana
Define mda-log-* pattern to see messages in the index. 

In order to login to Kibana you can use 'elastic' user. Password for this user can be fetched by the following command:
kubectl get secret elk-cluster-es-elastic-user -o=jsonpath='{.data.elastic}' -n elastic-system | base64 --decode; echo