resource "null_resource" "install_k3s" {
  provisioner "local-exec" {
    command = <<EOT
      curl -sfL https://get.k3s.io | sh -
      sudo k3s kubectl get nodes
    EOT
  }
}