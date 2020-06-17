{{/*
Include global labels
*/}}
{{- define "samples.labels" }}
{{- range $k, $v := .Values.global.labels }}
{{ $k }} : {{ $v}}
{{- end }}
{{- end }}
