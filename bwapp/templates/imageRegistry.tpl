{{/*
Include a component registry with option to override
*/}}
{{- define "bwapp.image.registry" }}
{{- if .Values.image.registry }}
{{- .Values.image.registry }}
{{- else }}
{{- .Values.global.image.registry }}
{{- end }}
{{- end }}
