import json
from kafka import KafkaProducer
from time import sleep
import logging
logger = logging.getLogger(__name__)

#load data from payload.json file (in json format data)
with open('/home/swapnil/atos-proj/kafka-python/payload.json') as f:
    d=json.load(f)

logger.setLevel(logging.DEBUG)
producer = KafkaProducer(bootstrap_servers=['kafka.kafka:9092'], linger_ms=3000 )
logger.addHandler(producer)
topic = "python_test"

# for n in range(5):  
#     my_data = {'num' : n}  
#     producer.send(topic, value = my_data)  
#     sleep(2)

#print(producer.bootstrap_connected())
ack = producer.send(topic,b'python_test')
metadata = ack.get()
print(metadata.topic,metadata.partition)

#for message in d:
#     print(json.dumps(message).encode('utf-8'))
#    ack = producer.send(topic,json.dumps(message).encode('utf-8'))
#    metadata = ack.get()
#    print(metadata.topic,metadata.partition)
#    producer.flush()