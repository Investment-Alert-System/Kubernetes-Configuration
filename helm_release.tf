# Traefik release
resource "null_resource" "traefik_helm_dependencies" {

  provisioner "local-exec" {
    command = <<EOT
      cd Helm/Traefik
      helm repo add traefik https://traefik.github.io/traefik-helm-chart
      helm dependency build
      cd ..
      cd ..

    EOT
  }
}

resource "helm_release" "traefik_release" {
  depends_on = [
    null_resource.prometheus_helm_dependencies
  ]

  name       = "traefik"
  namespace  = "default"
  chart      = "./Helm/Traefik"
}


# Prometheus-Stack release
resource "null_resource" "prometheus_helm_dependencies" {

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



resource "helm_release" "prometheus_grafana_stack_release" {
  depends_on = [
    null_resource.prometheus_helm_dependencies
  ]

  name       = "prometheus-stack"
  namespace  = "default"
  chart      = "./Helm/Prometheus-Stack"
}