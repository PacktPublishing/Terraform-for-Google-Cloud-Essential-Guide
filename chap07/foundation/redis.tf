locals {
  subnet_name = google_compute_subnetwork.this[var.subnets[0].name].name
}

resource "google_vpc_access_connector" "this" {
  provider   = google-beta
  depends_on = [google_compute_subnetwork.this]
  name       = var.vpc_connector_name
  region     = var.region
  subnet {
    name = local.subnet_name
  }
}
resource "google_redis_instance" "this" {
  name               = "redis"
  memory_size_gb     = 1
  tier               = "BASIC"
  region             = var.region
  authorized_network = google_compute_network.this.self_link
}

resource "google_secret_manager_secret" "redis_ip" {

  secret_id = "redis-ip"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "redis_ip" {
  # depends_on  = [google_redis_instance.this]
  secret      = google_secret_manager_secret.redis_ip.id
  secret_data = google_redis_instance.this.host
}
