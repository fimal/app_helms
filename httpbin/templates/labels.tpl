{{/*
Include global labels
*/}}
{{- define "httpbin.labels" }}
{{- range $k, $v := .Values.global.labels }}
{{ $k }} : {{ $v}}
{{- end }}
{{- end }}
