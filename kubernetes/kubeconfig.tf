resource "null_resource" "set_kubeconfig" {
  provisioner "local-exec" {
    command = <<EOT
        export KUBECONFIG=/etc/rancher/k3s/k3s.yaml
    EOT
  }
}