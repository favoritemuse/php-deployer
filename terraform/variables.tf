variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "domain" {
  description = "Domain name for the server"
  type        = string
}

variable "region" {
  description = "DigitalOcean region"
  type        = string
  default     = "ams3"
}

variable "size" {
  description = "Droplet size slug"
  type        = string
  default     = "s-1vcpu-1gb"
}

variable "ubuntu_image" {
  description = "Ubuntu image slug"
  type        = string
  default     = "ubuntu-24-04-x64"
}

variable "ssh_key_fingerprint" {
  description = "SSH key fingerprint for DigitalOcean"
  type        = string
}

variable "ssh_private_key_path" {
  description = "Path to SSH private key for Ansible connection"
  type        = string
  default     = "~/.ssh/admin"
}

variable "cloudflare_ips" {
  description = "Cloudflare IP ranges for firewall rules"
  type        = list(string)
  default = [
    "173.245.48.0/20", "103.21.244.0/22", "103.22.200.0/22",
    "103.31.4.0/22", "141.101.64.0/18", "108.162.192.0/18",
    "190.93.240.0/20", "188.114.96.0/20", "197.234.240.0/22",
    "198.41.128.0/17", "162.158.0.0/15", "104.16.0.0/13",
    "104.24.0.0/14", "172.64.0.0/13", "131.0.72.0/22"
  ]
}

variable "allowed_ips" {
  description = "IP addresses allowed for SSH and phpMyAdmin access"
  type        = list(string)
  default     = null
}
