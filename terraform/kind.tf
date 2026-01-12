resource "null_resource" "kind_cluster" {
  depends_on = [docker_container.vault]

  provisioner "local-exec" {
    command = "kind create cluster --name secure-ci"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "kind delete cluster --name secure-ci"
  }
}
