resource "google_compute_instance" "this" {
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
      // Ephemeral public IP
    }
  }

  metadata_startup_script = templatefile("startup.tftpl", { connection_name = data.terraform_remote_state.cloud_sql.outputs.connection_name })

  tags = ["http-server"]
}

