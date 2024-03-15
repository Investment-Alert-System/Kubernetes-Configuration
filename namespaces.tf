resource "kubernetes_namespace" "prometheus_namespace" {
  metadata {
    name = "prometheus"
  }
}

resource "kubernetes_namespace" "stock_data_importer_namespace" {
  metadata {
    name = "stock-data-importer"
  }
}

resource "kubernetes_namespace" "kafka_namespace" {
  metadata {
    name = "kafka"
  }
}