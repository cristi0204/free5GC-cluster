1. Kafka
Send message to kafka topic called 'logs' a json message.

Kafka producer:
invoke-kafka-logs-producer.sh

Example messages:
A. {"al_log_timestamp": 1663655923915000,"al_log_severity": 0,"al_log_timestamp_origin": 1663655923915000,"al_log_value": "TEST5 This is one line from the log, maybe contains word error.","al_log_type": "logMsg","al_log_subtype": "logMsg_1","al_log_name": "mda-logs"}

Kibana query: al_log_value : TEST3

B. This is an example of required syslog format in nims (sources were sending RFC5424 syslog format to fluentd which was making enrichments and transformation to json format):

{
  "__time": 1637409145000,
  "enricher": "172.23.95.74",
  "extradata": "-",
  "facility": "user",
  "facility_val": 1,
  "fluentd_tag": "fast.rsyslog.aop.user.info",
  "host": "nbg995t01jnptran102trnsf03.nbg995.poc.dcn.telekom.de",
  "ident": "var.log.audit",
  "ipaddress": "172.23.95.73",
  "message": "type=PATH msg=audit(1637409145.892:26872356): item=2 name=\"/lib/ld-musl-x86_64.so.1\" inode=226493031 dev=00:36 mode=0100755 ouid=0 ogid=0 rdev=00:00 obj=system_u:object_r:container_ro_file_t:s0 nametype=NORMAL cap_fp=0 cap_fi=0 cap_fe=0 cap_fver=0 cap_frootid=0\u001dOUID=\"root\" OGID=\"root\"",
  "msgid": "-",
  "pid": "-",
  "priority_val": 14,
  "severity": "info",
  "severity_val": 6
}

C. This is non-nims example, for which I have rsyslog config (below):
{
  "@timestamp": "2022-06-08T15:50:31.513522+02:00",
  "host": "m11343",
  "severity": "INFO",
  "severity_num": 6,
  "facility": "daemon",
  "facility_num": 3,
  "syslog-tag": "dstat.sh[741]:",
  "source": "dstat.sh",
  "message": " WHATEVER "
}

2. Logstash
Logstash fetches the message from the kafka and sends to Elastisearch.

3. Elasticsearch
Elasticsearch has defined policy and index template.
An mda-logs-YYYY-MM-DD daily index is created when new messages appear.

4. Kibana
Define mda-log-* pattern to see messages in the index. 

In order to login to Kibana you can use 'elastic' user. Password for this user can be fetched by the following command:
kubectl get secret elastic-eck-elasticsearch-es-elastic-user -o=jsonpath='{.data.elastic}' -n elastic-system | base64 --decode; echo


