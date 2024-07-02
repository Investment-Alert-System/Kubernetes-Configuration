provider "null" {

}

resource "null_resource" "install_k3s" {
  provisioner "remote-exec" {
    inline = [
      "curl -sfL https://get.k3s.io | sh -",
      "sudo k3s kubectl get nodes",
    ]
  }
}


