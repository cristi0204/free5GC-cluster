https://www.elastic.co/guide/en/cloud-on-k8s/master/k8s-beat-quickstart.html
https://www.elastic.co/guide/en/cloud-on-k8s/master/k8s-api-beat-k8s-elastic-co-v1beta1.html
https://www.elastic.co/guide/en/beats/filebeat/current/running-on-kubernetes.html

Apply the manifest to deploy Filebeat and collect the logs of all containers running in the Kubernetes cluster. ECK automatically configures the secured connection to an Elasticsearch cluster.

Kibana
https://kibana2.berlindevops.com/app/security/explore
https://kibana2.berlindevops.com/app/security/hosts?sourcerer=(default:(id:security-solution-default,selectedPatterns:!(%27filebeat-*%27)))&timerange=(global:(linkTo:!(timeline),timerange:(from:%272022-10-05T22:00:00.000Z%27,fromStr:now%2Fd,kind:relative,to:%272022-10-06T21:59:59.999Z%27,toStr:now%2Fd)),timeline:(linkTo:!(global),timerange:(from:%272022-10-05T22:00:00.000Z%27,fromStr:now%2Fd,kind:relative,to:%272022-10-06T21:59:59.999Z%27,toStr:now%2Fd)))