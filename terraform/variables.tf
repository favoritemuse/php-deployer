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
