project_id = "<PROJECT_ID>"

load_balancer = {
  forward_rule_name    = "fwd-three-tier"
  backend_service_name = "bs-three-tier"
  url_map_name         = "lb-three-tier"
  target_proxy_name    = "proxy-three-tier"
}


mig = {
  instance_template_name_prefix = "template-three-tier"
  mig_name                      = "mig-three-tier"
  mig_base_instance_name        = "three-tier"
  target_size                   = 2
  source_image                  = "debian-cloud/debian-11"
  machine_type                  = "e2-micro"
}