# # google_compute_instance_template.this:
resource "google_compute_instance_template" "this" {
  name_prefix  = var.mig.instance_template_name_prefix
  region       = var.region
  machine_type = var.mig.machine_type

  disk {
    source_image = var.mig.source_image
  }

  network_interface {
    subnetwork = data.terraform_remote_state.foundation.outputs.subnetwork_self_links["iowa"]
    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = file("startup.sh")

  tags = [
    "allow-iap",
    "allow-health-check"
  ]
  service_account {
    email  = data.terraform_remote_state.foundation.outputs.service_account_email
    scopes = ["cloud-platform"]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "this" {
  name               = var.mig.mig_name
  region             = var.region
  base_instance_name = var.mig.mig_base_instance_name
  target_size        = var.mig.target_size

  version {
    instance_template = google_compute_instance_template.this.id
  }

  named_port {
    name = "http"
    port = 80
  }

  update_policy {
    type            = "PROACTIVE"
    minimal_action  = "REPLACE"
    max_surge_fixed = 3
  }
}

