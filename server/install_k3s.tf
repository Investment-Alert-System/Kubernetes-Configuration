provider "null" {

}

variable "ssh_password" {
  description = "The password for SSH authentication"
  type        = string
  sensitive   = true
  default     = "NewUserphilipp!*"
}

resource "null_resource" "install_k3s" {
  provisioner "remote-exec" {
    inline = [
      "curl -sfL https://get.k3s.io | sh -",
      "sudo k3s kubectl get nodes",
      "mkdir -p ~/.kube",
      "cp /etc/rancher/k3s/k3s.yaml ~/.kube/config"
    ]

    connection {
      type = "ssh"
      user = "philipp"
      host     = "82.165.32.152"
      password = var.ssh_password
    }
  }
}


