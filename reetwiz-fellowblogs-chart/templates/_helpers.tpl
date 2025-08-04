{{/*
Expand the name of the chart.
*/}}
{{- define "reetwiz-fellowblogs-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "reetwiz-fellowblogs-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "reetwiz-fellowblogs-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "reetwiz-fellowblogs-chart.labels" -}}
helm.sh/chart: {{ include "reetwiz-fellowblogs-chart.chart" . }}
{{ include "reetwiz-fellowblogs-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels. These are the labels used by Services to find Pods.
*/}}
{{- define "reetwiz-fellowblogs-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "reetwiz-fellowblogs-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
