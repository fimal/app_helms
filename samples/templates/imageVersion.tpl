{{/*
Include a component version with option to override
*/}}
{{- define "samples.image.version" }}
{{- if .Values.image.version }}
{{- .Values.image.version }}
{{- else }}
{{- .Values.global.image.version }}
{{- end }}
{{- end }}
