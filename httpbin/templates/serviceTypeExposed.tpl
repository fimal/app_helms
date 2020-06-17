{{/*
Include an internal service node port
*/}}
{{- define "httpbin.serviceTypeExposed" }}
{{- if .Values.global.useLoadBalancer }}
  type: LoadBalancer
{{- else }}
{{- include "httpbin.serviceTypeInternal" . }}
{{- end }}
{{- end }}
