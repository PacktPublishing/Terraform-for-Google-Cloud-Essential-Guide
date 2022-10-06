output "URL" {
  value = "https://${google_compute_global_forwarding_rule.this.ip_address}"
}