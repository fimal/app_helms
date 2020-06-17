{{/*
Include an internal service node port
*/}}
{{- define "app1.serviceTypeExposed" }}
{{- if .Values.global.useLoadBalancer }}
  type: LoadBalancer
{{- else }}
{{- include "app1.serviceTypeInternal" . }}
{{- end }}
{{- end }}
