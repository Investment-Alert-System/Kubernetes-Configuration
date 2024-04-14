resource "null_resource" "helm_dependencies" {

  provisioner "local-exec" {
    command = <<EOT
      cd Helm/Prometheus-Stack
      helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
      helm dependency build
      cd ..
      cd ..
    EOT
  }
}



resource "helm_release" "prometheus_grafana_stack" {
  depends_on = [
    null_resource.helm_dependencies
  ]

  name       = "prometheus-stack"
  namespace  = "default"
  chart      = "./Helm/Prometheus-Stack"
}