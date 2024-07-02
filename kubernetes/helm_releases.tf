resource "helm_release" "investment-alert-frontend"{
    name = "${var.context}-${var.stage}-frontend"
    chart = "../Helm/investment-alert-frontend"
    namespace = "investment-alert-frontend"
}

resource "helm_release" "stock-data-streamer" {
    name = "${var.context}-${var.stage}-backend"
    chart = "../Helm/stock-data-streamer"
    namespace = "stock-data-streamer"
}


resource "helm_release" "prometheus-stack" {
    name = "${var.context}-${var.stage}-prometheus"
    chart = "../Helm/prometheus-stack"
    namespace = "prometheus"
    depends_on = [ null_resource.prometheus_update ]
}

resource "null_resource" "prometheus_update" {
  provisioner "local-exec" {
    command = <<EOT
      cd ..
      cd ./Helm/prometheus-stack
      helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
      helm dependency build
      cd ../..
    EOT
  }
}