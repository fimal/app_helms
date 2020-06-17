{{/*
Include an internal service node port
*/}}
{{- define "samples.serviceTypeInternal" }}
{{- if .Values.global.useNodePort }}
  type: NodePort
{{- else }}
  type: ClusterIP
{{- end }}
{{- end }}
