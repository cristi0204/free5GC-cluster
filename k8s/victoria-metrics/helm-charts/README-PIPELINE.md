1. Kafka
Send a json message to the kafka

Example message:  
  {"measurement":"usage","resource":"cpu","value":91}

Kafka producer invocation:
  ./invoke-kafka-metrics-producer.sh

2. Telegraf
Process kafka message as json data format. json_v2 is not support by telegraf helm chart templates.

3. VictoriaMetrics
Read metric stored in VictoriaMetrics
  ./invoke-vmselect.sh

4. Vmalert
For metrics with the value greater than 77 an alert is triggered and forwarded to Alertmanagera. 
following rule is executed:
  usage_value{resource="cpu"} > 77

5. AlertManager
Forwarded alerts are available in Alertmanager
  https://alertmanager.berlindevops.com/
