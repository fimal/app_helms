{{/*
Include an internal service node port
*/}}
{{- define "bwapp.serviceTypeInternal" }}
{{- if .Values.global.useNodePort }}
  type: NodePort
{{- else }}
  type: ClusterIP
{{- end }}
{{- end }}
