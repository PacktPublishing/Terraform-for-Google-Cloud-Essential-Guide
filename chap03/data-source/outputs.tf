output "zones" {
  value = [for s in google_compute_instance.this[*] : "${s.name}: ${s.zone}"]
}
