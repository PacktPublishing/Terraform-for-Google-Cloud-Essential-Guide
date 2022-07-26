module "server1" {
  source       = "../modules/server"
  name         = "${var.server_name}-1"
  machine_size = "medium"
  environment  = var.environment
}

module "server2" {
  source       = "../modules/server"
  name         = "${var.server_name}-2"
  machine_size = "medium"
  environment  = var.environment
}

module "server3" {
  source       = "../modules/server"
  name         = "${var.server_name}-3"
  machine_size = "large"
  environment  = var.environment
}
