config.yaml template can't properly prepare telegraf.conf file for json_v2 format (data_format: "json_v2").
Configuration of this format requires two square brackets in some places (see the comments below).
So the generated file, stored in the config map should be corrected manualy.

    [[inputs.kafka_consumer]]
      brokers = [
        "kafka-cluster-kafka-bootstrap-external-victoriametrics:9092"
      ]
      data_format = "json_v2"
      topics = [
        "metrics"
      ]
      [[inputs.kafka_consumer.json_v2]] #lack of openining and closing bracket in the generated config file
        measurement_name = "usage"
          [[inputs.kafka_consumer.json_v2.field]] #lack of openining and closing bracket in the generated config file
            path = "value"
          [[inputs.kafka_consumer.json_v2.tag]] #lack of openining and closing bracket in the generated config file
            path = "resource"


Currently prepared configuration uses older version of json format (data_format: "json")

Expected json object on the kafka topic:

{"measurement":"usage","resource":"cpu","value":93}

Data can be read with the following command:

curl -G 'http://localhost:8481/select/0/prometheus/api/v1/export' -d 'match={__name__=~"usage_value.*",resource="cpu",host="telegraf-polling-service"}'