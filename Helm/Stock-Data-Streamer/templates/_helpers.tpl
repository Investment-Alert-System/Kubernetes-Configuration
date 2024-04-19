{{/*
Expand the name of the chart.
*/}}
{{- define "stock-data-streamer.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "stock-data-streamer.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name "stock-data-streamer" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "stock-data-streamer.labels" -}}
helm.sh/chart: {{ include "stock-data-streamer.chart" . }}
{{ include "stock-data-streamer.selectorLabels" . }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "stock-data-streamer.selectorLabels" -}}
app.kubernetes.io/name: {{ include "stock-data-streamer.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Chart name and version
*/}}
{{- define "stock-data-streamer.chart" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" }}
{{- end -}}
