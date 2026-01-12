resource "null_resource" "install_ansible" {
  provisioner "local-exec" {
    command = <<EOF
      if ! command -v ansible >/dev/null 2>&1; then
        echo "Installing Ansible..."
        sudo apt-get update -y
        sudo apt-get install -y ansible
      else
        echo "Ansible already installed"
      fi
    EOF
  }
}

resource "null_resource" "configure_local" {
  depends_on = [null_resource.install_ansible]

  provisioner "local-exec" {
    command = "ansible-playbook ansible/setup-ci-controller.yml"
  }
}
