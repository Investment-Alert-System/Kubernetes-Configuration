resource "kubernetes_namespace" "prometheus_namespace" {
  metadata {
    name = "prometheus"
  }
}