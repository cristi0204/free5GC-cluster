Following steps allow to consume third party files and store in ELK.

1. Fluentd exposes 5170 port which listens to new messages.
2. There are defined two grok patterns to parse messages:
    <source>
      @type tcp
      port 5170
      bind 0.0.0.0
      tag tcp.events
      <parse>
        @type grok
        <grok>
          pattern %{TIMESTAMP_ISO8601:datetime}.\[%{WORD:loglevel}\]\[%{WORD:function}\]\[%{WORD:module}\]%{GREEDYDATA:message}
        </grok>        
        <grok>
          pattern \[%{TIMESTAMP_ISO8601}.%{WORD:milisec}\].\[%{WORD:module}\].\[%{WORD:loglevel}\]%{GREEDYDATA:message}
        </grok>        
      </parse>
      #@KUBERNETES
    </source>

Example messages for:
A. first pattern:
2022-10-19T11:26:44Z [INFO][UPF][Main] GTP Address: "10.100.50.233:2152"

B. second pattern:
[2022-10-26 12:21:20.079] [rrc] [warning] Acceptable cell selection failed in [1] cells. [0] no SI, [0] reserved, [1] barred, ftai [0]

3. To send files to fluentd there should be forwarding started. 
At the moment no service is defined so traffic is forwarded to one of the pods (e.g. fluentd-fs-hbdl8)

kubectl --namespace file-share port-forward fluentd-fs-hbdl8 5170

4. Files can be send to open port e.g. via netcat
cat amflogs.log | netcat localhost 5170
cat ausflogs.log | netcat localhost 5170
cat smflogs.log | netcat localhost 5170
cat uelogs.log | netcat localhost 5170
cat upflogs.log | netcat localhost 5170


Useful pages:

Grok debuger
https://grokdebug.herokuapp.com/

Grok patterns
https://github.com/hpcugent/logstash-patterns/blob/master/files/grok-patterns