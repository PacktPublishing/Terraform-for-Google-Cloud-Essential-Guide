module "server1" {
  source       = "./modules/server"
  name         = "${var.server_name}-1"
  zone         = var.zone
  machine_type = var.machine_type
  static_ip    = true
}
module "server2" {
  source       = "./modules/server"
  name         = "${var.server_name}-2"
  zone         = var.zone
  machine_type = var.machine_type
  static_ip    = false
}

module "server3" {
  source       = "./modules/server"
  name         = "${var.server_name}-3"
  zone         = var.zone
  machine_type = "e2-small" 
  static_ip    = true
}