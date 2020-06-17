{{/*
Include an internal service node port
*/}}
{{- define "samples.serviceTypeExposed" }}
{{- if .Values.global.useLoadBalancer }}
  type: LoadBalancer
{{- else }}
{{- include "samples.serviceTypeInternal" . }}
{{- end }}
{{- end }}
