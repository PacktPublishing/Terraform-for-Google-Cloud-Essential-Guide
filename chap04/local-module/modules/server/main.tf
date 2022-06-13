resource "google_compute_address" "static" {
  count = var.static_ip ? 1 : 0
  name  = "${var.name}-ipv4-address"
}

resource "google_compute_instance" "this" {
  name         = var.name
  zone         = var.zone
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
    dynamic "access_config" {
      for_each = var.static_ip ? ["1"] : []
      content {
        nat_ip = google_compute_address.static[0].address
      }
    }
  }

  metadata_startup_script = file("${path.module}/startup.sh")
  tags                    = ["http-server", ]
}