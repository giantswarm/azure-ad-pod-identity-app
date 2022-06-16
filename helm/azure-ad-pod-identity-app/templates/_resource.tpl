{{- define "resource.default.namespace" -}}
  {{- .Release.Namespace | replace "." "-" | trunc 47 | trimSuffix "-" -}}
{{- end -}}
