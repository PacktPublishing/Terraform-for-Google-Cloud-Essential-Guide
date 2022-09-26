module "network" {
  source       = "terraform-google-modules/network/google"
  version      = "5.2.0"
  project_id   = var.project_id
  network_name = "my-network"

  subnets = [
    {
      subnet_name   = "us-west1"
      subnet_region = "us-west1"
      subnet_ip     = "10.10.10.0/24"
    },
    {
      subnet_name   = "us-east1"
      subnet_region = "us-east1"
      subnet_ip     = "10.10.20.0/24"
    },
  ]
}

module "deny_ssh_ingress" {
  source       = "terraform-google-modules/network/google//modules/firewall-rules"
  version      = "5.2.0"
  project_id   = var.project_id
  network_name = module.network.network_name

  rules = [{
    name                    = "${module.network.network_name}-deny-ssh-ingress"
    description             = null
    direction               = "INGRESS"
    priority                = null
    ranges                  = ["0.0.0.0/0"]
    source_tags             = null
    source_service_accounts = null
    target_tags             = null
    target_service_accounts = null
    deny = [{
      protocol = "tcp"
      ports    = ["22"]
    }]
    allow = []
    log_config = {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }]
}