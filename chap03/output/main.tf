data "google_compute_zones" "available" {
  region = var.region
}

resource "google_compute_instance" "this" {
  count        = var.instance_number
  name         = "${var.server_name}-${count.index}"
  machine_type = var.machine_type
  zone         = data.google_compute_zones.available.names[count.index % length(data.google_compute_zones.available.names)]

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
  tags = ["http-server"]

  metadata_startup_script = file("startup.sh")
}
