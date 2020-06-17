{{/*
Include an internal service node port
*/}}
{{- define "bwapp.serviceTypeExposed" }}
{{- if .Values.global.useLoadBalancer }}
  type: LoadBalancer
{{- else }}
{{- include "bwapp.serviceTypeInternal" . }}
{{- end }}
{{- end }}
