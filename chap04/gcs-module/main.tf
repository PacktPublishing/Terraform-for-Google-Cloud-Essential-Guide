module "server1" {
  source    = "gcs::https://www.googleapis.com/storage/v1/terraform-for-gcp/modules/server"
  name         = "${var.server_name}-1"
}

module "server2" {
  source    = "gcs::https://www.googleapis.com/storage/v1/terraform-for-gcp/modules/server.tar.gz"
  name         = "${var.server_name}-2"
  zone         = var.zone
  machine_size = "medium"
}

module "server3" {
  source    = "gcs::https://www.googleapis.com/storage/v1/terraform-for-gcp/modules/server"
  name         = "${var.server_name}-3"
  zone         = "us-central1-f"
  machine_size = "large"
  static_ip    = false
}
