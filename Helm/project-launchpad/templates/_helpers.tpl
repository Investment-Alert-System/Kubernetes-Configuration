{{/*
Expand the name of the chart.
*/}}
{{- define "project-launchpad.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "project-launchpad.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "project-launchpad" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "project-launchpad.labels" -}}
helm.sh/chart: {{ include "project-launchpad.chart" . }}
{{ include "project-launchpad.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "project-launchpad.selectorLabels" -}}
app.kubernetes.io/name: {{ include "project-launchpad.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Chart name and version
*/}}
{{- define "project-launchpad.chart" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
{{- end -}}