# About The Project

This project "kafkaTest" expose the REST API for testing the Kafka Push Message. Also, it verifies that whatever message we pushed to Kafka topic (e.g., "logs") it reached to the Elastic Search.

## Prerequisites
This project needs below software installed on your machine
* Python
* Docker 
* Login to image repository (e.g., harbor.berlindevops.com)
* Connected to the K8s cluster where you want to deploy the image.

## How to build Docker image
Clone this project wherever you want. Go to the project folder (e.g., KafkaTest). To build the Docker image for this project you need to execute the following script. You need to provide <image name> and <tag version> as parameter.
```bash
sudo bash buildKafkaTestImage.sh <image name> <tag version>
```
For Example,
```bash
sudo bash buildKafkaTestImage.sh kafkatestimg 1.1
```
Once you execute the above script, it will create the docker image, tag the image and push the image to the image repository. You will see the below line in the output. 
```bash
.....
REPOSITORY                                           TAG       IMAGE ID       CREATED        SIZE
kafkatestimg                                         latest    12cf1556e185   22 hours ago   1.07GB
harbor.berlindevops.com/library/kafkatestimg         1.1       12cf1556e185   22 hours ago   1.07GB
.....
```
You can verify that image is pushed to image repository.
*Note: If you not logged into image repository script will ask user credentials while executing it.*

## How to Deploy built image

To deploy the existing Docker image which is already pushed into image repository in above step you need to execute the following script. Before executing this script you must connect with the K8s cluster. Then only we are able to deploy image on K8s cluster. You need to modify the kafka-msgGenrator.yaml also to update the image value. Update the docker image name and version you just built in above steps.
```yaml
image: harbor.berlindevops.com/library/kafkatestimg:1.1
``` 
You need to provide <k8s-name-space> as parameter. 

```bash
bash deployKafkaTestImage.sh <k8s-name-space>
```
For Example,
```bash
bash deployKafkaTestImage.sh elastic-tests
```
Once you execute the above script, it will deploy the image in K8s cluster in the mentioned name-space. 
You can verify that image is deployed on K8s cluster by using below command.
```bash
kubectl get pods --namespace=elastic-tests
kubectl get svc --namespace=elastic-tests
kubectl describe services <service-name>  --namespace=elastic-tests
```

## Verify the Deployment

You can verify that image is deployed on K8s cluster by testing below service.
```bash
kubectl describe services <service-name>  --namespace=elastic-tests
```
It will display the service details as below -
```bash
Name:              kafkamsg-service
Namespace:         elastic-tests
Labels:            <none>
Annotations:       <none>
Selector:          app=kafkamsg-generator
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.43.89.18
IPs:               10.43.89.18
Port:              <unset>  4422/TCP
TargetPort:        4422/TCP
Endpoints:         10.42.88.79:4422
Session Affinity:  None
Events:            <none>
```
Now, execute the curl command within the pod container created by above script. Using below command to get a shell to the running container. In the curl command you can use the Endpoints mentioned in the above output(e.g., 10.42.88.79:4422) to call the service instead of service name. If message successful then it will show you the success message.

```bash
kubectl exec --stdin -n elastic-tests --tty kafkatestpod -- /bin/bash
root@kafkatestpod:/usr/app/src# curl http://kafkamsg-service:4422/kafkamsg-service
Pass: Message delivered from kafka to Elastic Search...root@kafkatestpod12:/usr/app/src#
```
If message not successful then it will show you the Failed message.
```bash
kubectl exec --stdin -n elastic-tests --tty kafkatestpod -- /bin/bash
root@kafkatestpod:/usr/app/src# curl http://kafkamsg-service:4422/kafkamsg-service
Failed: Message not delivered from kafka to Elastic Search...root@kafkatestpod12:/usr/app/src#
```
## Usage
This REST API is used for following purpose -
* Part1 - To push the messages to Kafka log topic. Service generates log object and send this log message to log topic.
* Once the message is delivered to Kafka then next part 2 will be executed
* Part2 - Verify that sent message is delievered to the Elasticsearch by Kafka
* If message delivered successfully will received Pass message else received the Failed message.

You can use the RSET API by using curl command like below. Use the service name "kafkamsg-service" after service-name:port. By default GET method is called. Right, now only GET method is available for this API.

```bash
curl http://kafkamsg-service:4422/kafkamsg-service
```