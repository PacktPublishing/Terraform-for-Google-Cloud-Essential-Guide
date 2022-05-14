resource "google_compute_instance" "this" {
  name         = "key-file"
  machine_type = "e2-small"
  # zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
  }
}
