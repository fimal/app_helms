{{/*
Include global labels
*/}}
{{- define "bwapp.labels" }}
{{- range $k, $v := .Values.global.labels }}
{{ $k }} : {{ $v}}
{{- end }}
{{- end }}
