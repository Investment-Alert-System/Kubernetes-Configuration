resource "kubernetes_namespace" "microservice_namespaces" {
  count = length(var.microservices)

  metadata {
    name = var.microservices[count.index]
  }
}