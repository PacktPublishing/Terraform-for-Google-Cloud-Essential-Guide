output "zones-splat" {
  description = "List of zones using a splat expression"
  value       = google_compute_instance.this[*].zone
}

output "zones-for" {
  description = "List of zones using a for loop"
  value       = [for server in google_compute_instance.this : server.zone]
}

output "zones-by-servers" {
  description = "Name of zone for each server"
  value       = [for s in google_compute_instance.this[*] : "${s.name}: ${s.zone}"]
}


output "URL_0" {
  description = "URL of first server"
  value       = format("http://%s", google_compute_instance.this[0].network_interface[0].access_config[0].nat_ip)
}