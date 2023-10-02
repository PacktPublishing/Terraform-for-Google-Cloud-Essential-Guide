# main.tf

provider "google" {
  credentials = file("terraform-service-key.json")
  project     = "using-terraf-157-8db7dc35"
  region      = "us-central1"
}

resource "google_compute_instance" "this" {
  name         = "cloudshell"
  machine_type = "e2-small"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
  }
}