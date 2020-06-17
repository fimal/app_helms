{{/* 
volumes configuration for pods where
 one container (enforcer) writes logs 
 and another (fluent-bit) reads them
*/}}
{{- define "bwapp.fluent-bit-volumes" }}
- name: securebeat-ca-volume
  configMap:
    name: {{ .Values.global.namesPrefix }}securebeat-ca-config
- name: securebeat-client-volume
  secret:
    secretName: {{ .Values.global.namesPrefix }}securebeat-client-secret
- name: logs-volume
  emptyDir: {}
{{- end -}}