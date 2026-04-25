terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "server" {
  image  = var.ubuntu_image
  name   = var.domain
  region = var.region
  size   = var.size
  tags   = ["web-server"]
  ssh_keys = [var.ssh_key_fingerprint]

  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.ssh_private_key_path)
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Server ready at ${self.ipv4_address}'"
    ]
  }
}
