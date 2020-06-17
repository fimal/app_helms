{{/*
Include an internal service node port
*/}}
{{- define "app1.serviceTypeInternal" }}
{{- if .Values.global.useNodePort }}
  type: NodePort
{{- else }}
  type: ClusterIP
{{- end }}
{{- end }}
