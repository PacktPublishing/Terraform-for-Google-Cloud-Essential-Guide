module "server1" {
  source       = "git::https://github.com/PacktPublishing/Terraform-for-Google-Cloud-Essential-Guide.git//chap04/modules/server"
  name         = "${var.server_name}-1"
}

module "server2" {
  source       = "github.com/nc-bnordha/server.git?ref=v2.0.0"
  name         = "${var.server_name}-2"
  zone         = var.zone
  machine_size = "medium"
}

module "server3" {
  source       = "github.com/nc-bnordha/server.git?ref=v1.0.0"
  name         = "${var.server_name}-3"
  zone         = "us-central1-f"
  machine_size = "large"
  static_ip    = true
}
