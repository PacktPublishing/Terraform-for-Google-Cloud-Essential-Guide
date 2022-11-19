output "URL" {
  value = "http://${google_compute_global_forwarding_rule.this.ip_address}"
}