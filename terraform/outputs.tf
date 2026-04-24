output "server_ip" {
  description = "Public IP address of the droplet"
  value       = digitalocean_droplet.server.ipv4_address
}

output "server_name" {
  description = "Name of the droplet"
  value       = digitalocean_droplet.server.name
}
