resource "google_compute_instance" "this" {
  depends_on = [google_compute_disk.this]

  name         = var.server_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }
  }

  # attached_disk {
  #   source = "small-disk"
  #   mode   = var.disks["small-disk"]["mode"]
  # }

  # attached_disk {
  #   source = "medium-disk"
  #   mode   = var.disks["medium-disk"]["mode"]
  # }

  # attached_disk {
  #   source = "large-disk"
  #   mode   = var.disks["large-disk"]["mode"]
  # }

  dynamic "attached_disk" {
    for_each = var.disks
    content {
      source = attached_disk.key
      mode   = attached_disk.value["mode"]
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }
}
