{{/*
Include a component registry with option to override
*/}}
{{- define "app1.image.registry" }}
{{- if .Values.image.registry }}
{{- .Values.image.registry }}
{{- else }}
{{- .Values.global.image.registry }}
{{- end }}
{{- end }}
