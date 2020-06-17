{{/*
fluentbit container manifest
reads enforcer logs (security + access) and sends over http(s) to logstash
*/}}
{{ define "samples.fluent-bit-container" }}
- name: fluentbit
  image: {{ include "samples.image.registry" . | coalesce .Values.containers.fluentbit.registry }}/waas-fluentbit{{ include "samples.image.version" . | coalesce .Values.containers.fluentbit.version }}
  imagePullPolicy: {{ .Values.global.image.pullPolicy }}
  env:
  - name: FB_LS_HOST
    value : {{ .Values.global.namesPrefix }}logstash-service.{{ .Values.global.kwafns }}.svc.cluster.local
  - name: FB_PREFIX
    value: "{{ .Chart.Name }}.{{ .Release.Namespace }}"
  resources:
    {{- toYaml .Values.containers.fluentbit.resources | nindent 4 }}
  volumeMounts:
  - name: securebeat-client-volume
    mountPath: /etc/securebeat/client
  - name: securebeat-ca-volume
    mountPath: /etc/securebeat/ca
  - name: logs-volume
    mountPath: /logs
{{- end -}}
