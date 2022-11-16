resource "google_compute_instance" "google_compute_instance" {
  name         = var.server_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}

output "static_ip_address" {
  description = "Static IP Address"
  value       = google_compute_instance.google_compute_instance.network_interface[0].access_config[0].nat_ip
}

