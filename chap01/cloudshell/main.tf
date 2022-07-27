terraform {
  required_version = "~> 1.2"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.29"
    }
  }
}

resource "google_compute_instance" "this" {
  name         = "cloudshell"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  network_interface {
    network = "default"
  }
}
