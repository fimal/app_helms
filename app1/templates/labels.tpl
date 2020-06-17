{{/*
Include global labels
*/}}
{{- define "app1.labels" }}
{{- range $k, $v := .Values.global.labels }}
{{ $k }} : {{ $v}}
{{- end }}
{{- end }}
