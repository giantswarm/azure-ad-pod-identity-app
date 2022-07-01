{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "aad-pod-identity.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 59 | trimSuffix "-" -}}
{{- end -}}

{{- define "aad-pod-identity-psp.mic.fullname" -}}
{{- printf "%s-psp-mic" (include "aad-pod-identity.name" .) -}}
{{- end }}

{{- define "aad-pod-identity-psp.nmi.fullname" -}}
{{- printf "%s-psp-nmi" (include "aad-pod-identity.name" .) -}}
{{- end }}


{{/*
Create a default fully qualified app name.
We truncate at 63 chars (minus 4 for suffix) because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "aad-pod-identity.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 59 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 59 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 59 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "aad-pod-identity.mic.fullname" -}}
{{- printf "%s-mic" (include "aad-pod-identity.name" .) -}}
{{- end }}

{{- define "aad-pod-identity.nmi.fullname" -}}
{{- printf "%s-nmi" (include "aad-pod-identity.name" .) -}}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "aad-pod-identity.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common selectors.
*/}}
{{- define "aad-pod-identity.selectors" -}}
app.kubernetes.io/name: {{ template "aad-pod-identity.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Common labels.
*/}}
{{- define "aad-pod-identity.labels" -}}
{{- include "aad-pod-identity.selectors" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/configuration-checksum: {{ toJson .Values | sha256sum | trunc 48 | quote }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
helm.sh/chart: {{ template "aad-pod-identity.chart" . }}
{{- end -}}
{{- define "aad.crdInstall" -}}
{{- printf "%s-%s" ( include "name" . ) "crd-install" | replace "+" "_" | trimSuffix "-" -}}
{{- end -}}

{{- define "aad.CRDInstallAnnotations" -}}
"helm.sh/hook": "pre-install,pre-upgrade"
"helm.sh/hook-delete-policy": "before-hook-creation,hook-succeeded"
{{- end -}}

{{- define "aad.selectorLabels" -}}
app.kubernetes.io/name: "{{ template "name" . }}"
app.kubernetes.io/instance: "{{ template "name" . }}"
{{- end -}}

{{/* Create a label which can be used to select any orphaned crd-install hook resources */}}
{{- define "aad.CRDInstallSelector" -}}
{{- printf "%s" "crd-install-hook" -}}
{{- end -}}
