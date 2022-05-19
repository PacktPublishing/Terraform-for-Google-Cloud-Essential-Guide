resource "google_compute_firewall" "firewall" {
  count   = length(var.firewall)
  network = google_compute_network.this.id
  name    = "${google_compute_network.this.name}-${var.firewall[count.index]["name"]}"

  direction = var.firewall[count.index]["direction"]
  allow {
    protocol = var.firewall[count.index]["allow"]["protocol"]
    ports    = var.firewall[count.index]["allow"]["ports"]
  }
  source_ranges = var.firewall[count.index]["source_ranges"]
  target_tags   = var.firewall[count.index]["target_tags"]
}