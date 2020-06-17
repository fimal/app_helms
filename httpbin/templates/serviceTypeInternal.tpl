{{/*
Include an internal service node port
*/}}
{{- define "httpbin.serviceTypeInternal" }}
{{- if .Values.global.useNodePort }}
  type: NodePort
{{- else }}
  type: ClusterIP
{{- end }}
{{- end }}
