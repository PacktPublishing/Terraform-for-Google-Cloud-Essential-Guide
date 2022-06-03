data "google_compute_instance" "this" {
  name = "instance-1"
}
output "ip-address" {
  value = format("IP address of existing server: %s", data.google_compute_instance.this.network_interface[0].access_config[0].nat_ip)
}
