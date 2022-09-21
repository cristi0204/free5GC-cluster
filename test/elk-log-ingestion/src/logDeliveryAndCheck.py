#!/usr/bin/env python
# Created on Fri Sept 15 12:55 2022
# @author: Urmila Biradar
# 
# Using confluent_kafka Producer.
# Generate log object and send it to Kafka.
#

from confluent_kafka import Producer
import sys
import time
import requests
import json
import random
from random import randint

current_milli_time = lambda: int(round(time.time() * 1000))
current_micro_time = lambda: int(round(time.time() * 1000 * 1000))
log_value_list = ['This is one sentence from the log.', 'This is one line from the log, maybe contains word error.', 'This is warning from the log.', 'This is notification from the log.', 'This is info line from the log.']

loopWaitTime = 10
loopCount = 5

def gen_log_json():
    data={}
    data['al_log_timestamp'] = current_micro_time()
    data['al_log_timestamp_origin'] = current_micro_time()
    data['al_log_source'] = "MDA"
    data['al_log_name'] = "mda-logs"
    data['al_log_type'] = "logMsg"
    data['al_log_subtype'] = "logMsg_1"
    data['al_log_severity'] = randint(0, 5)
    data['al_log_value'] = random.choice(log_value_list)
    data_json = json.dumps(data)
    return data_json

def kafka_test_msg():
    
    ############ Part 1 Send log msg to Kafka  ############
    # set values for kafka bootstarp_server and topic
    broker = "kafka.kafka.svc.cluster.local:9092" 
    topic = "logs"
    searchString = ""

    # Producer configuration
    conf = {'bootstrap.servers': broker}

    # Create Producer instance
    p = Producer(**conf)

    # Optional per-message delivery callback (triggered by poll() or flush())
    # when a message has been successfully delivered or permanently
    # failed delivery (after retries).
    def delivery_callback(err, msg):
        if err:
            sys.stderr.write('%% Message failed delivery: %s\n' % err)
        else:
            sys.stderr.write('%% Message delivered to %s [%d] @ %d\n' %
                             (msg.topic(), msg.partition(), msg.offset()))

    # send message to kafka topic like "logs"
    try:
        logjsonData = gen_log_json()
        logjson_dict = json.loads(logjsonData)
        # create search value from newly generated log data in the format "al_log_timestamp": 1663071867173782
        searchString = '"al_log_timestamp":' + str(logjson_dict['al_log_timestamp'])

        # send log data message to kafka
        p.produce(topic, logjsonData, callback=delivery_callback)
        p.produce(topic, gen_log_json(), callback=delivery_callback)

    except BufferError:
        sys.stderr.write('%% Local producer queue is full (%d messages awaiting delivery): try again\n' %
                            len(p))

    # Serve delivery callback queue.
    # NOTE: Since produce() is an asynchronous API this poll() call
    #       will most likely not serve the delivery callback for the
    #       last produce()d message.
    p.poll(0)

    # Wait until all messages have been delivered
    sys.stderr.write('%% Waiting for %d deliveries\n' % len(p))
    p.flush()

    ############ Part 2 Check msg delivery to Elastic Search from Kafka ############
    requests.packages.urllib3.disable_warnings()

    url = 'https://elk-cluster-es-http.elastic-system.svc:9200/mda-logs-*/_search'
    headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ZWxhc3RpYzo5QWU3N2w5ZDQ0N3JUbnUza3dNTDBNN1c=',
    }

    print("searchString: ", searchString)
    #data = '{"query": {"term": {"_id": "jUjtOoMBBGP-lDVjdirA" } } }'
    data = '{"query": {"term": {'+searchString+' } } }'
    print("data to be searched: ", data)
    
    returnMsg = ""

    # iterate till data get searched or 5 times if not found
    i = 0
    while i < loopCount:
        i += 1
        response = requests.post(url, headers=headers, data=data, verify=False) ## to search for specific record
        #response = requests.post(url, headers=headers, verify=False) ## to get all records
        print(response.content)
        # check is _id value is present in result
        print("searchString: ", searchString)
        print(type(response.content))
        if response.content.decode('UTF-8').find(searchString) != -1:
            returnMsg = "Pass: Message delivered from kafka to Elastic Search..."
            print(returnMsg)
            break
        
        print("wait for "+str(loopWaitTime)+" seconds to search next...")
        time.sleep(loopWaitTime)
    else:
        returnMsg = "Failed: Message not delivered from kafka to Elastic Search..."
        print(returnMsg)

    return returnMsg
