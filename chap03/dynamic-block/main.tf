resource "google_compute_instance" "this" {
  name         = var.server_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  attached_disk {
    source = google_compute_disk.this["small-disk"].name
    mode   = var.disks["small-disk"]["mode"]
  }

  attached_disk {
    source = google_compute_disk.this["medium-disk"].name
    mode   = var.disks["medium-disk"]["mode"]
  }

  attached_disk {
    source = google_compute_disk.this["large-disk"].name
    mode   = var.disks["large-disk"]["mode"]
  }

  # dynamic "attached_disk" {
  #   for_each = var.disks
  #   content {
  #     source = google_compute_disk.this[attached_disk.key].name
  #     mode   = attached_disk.value["mode"]
  #   }
  # }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
}
