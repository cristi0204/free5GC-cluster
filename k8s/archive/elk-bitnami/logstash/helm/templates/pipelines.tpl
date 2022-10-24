apiVersion: v1
kind: ConfigMap
metadata:
  name: multiplepipelines
data:
{{ (.Files.Glob "pipelines/*").AsConfig | indent 2 }}