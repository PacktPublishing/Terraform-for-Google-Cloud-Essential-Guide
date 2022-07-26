module "server1" {
  source      = "./modules/server"
  name        = "${var.server_name}-1"
  environment = var.environment
}

module "server2" {
  source       = "./modules/server"
  name         = "${var.server_name}-2"
  zone         = var.zone
  machine_size = "medium"
  environment  = var.environment
}

module "server3" {
  source       = "./modules/server"
  name         = "${var.server_name}-3"
  zone         = "us-central1-f"
  machine_size = "large"
  static_ip    = true
  environment  = var.environment
}
