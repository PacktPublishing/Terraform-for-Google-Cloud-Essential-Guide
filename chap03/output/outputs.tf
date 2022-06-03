output "zones" {
  description = "Name of zone for each server"
  value       = [for s in google_compute_instance.this[*] : "${s.name}: ${s.zone}"]
}

output "URL_0" {
  description = "URL of first server"
  value       = format("http://%s", google_compute_instance.this[0].network_interface[0].access_config[0].nat_ip)

}


