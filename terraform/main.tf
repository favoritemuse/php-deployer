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
}
