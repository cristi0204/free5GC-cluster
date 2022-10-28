MDA component (fluentd-sm namespace)

It is a fluentd instance dedicated for self-monitoring.
Fluentd consumes the log files produced by container and sends to kafka.
Fluentd is run as DemonSet so there is one instance of fluentd on each k8s node. 