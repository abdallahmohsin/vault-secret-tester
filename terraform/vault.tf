resource "docker_image" "vault" {
  name = "vault:1.15"
}

resource "docker_container" "vault" {
  name  = "vault"
  image = docker_image.vault.name

  ports {
    internal = 8200
    external = 8200
  }

  capabilities {
    add = ["IPC_LOCK"]
  }

  env = [
    "VAULT_DEV_ROOT_TOKEN_ID=${var.vault_token}",
    "VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200"
  ]

  command = [
    "server",
    "-${var.deployment_mode}"
  ]
}
