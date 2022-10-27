output "network_self_link" {
  value = module.vpc.network_name
}

output "subnets" {
  value = module.vpc.subnets["${var.region}/${var.network.subnetwork_name}"].name
}



# output "kubernetes_endpoint" {
#   sensitive = true
#   value     = module.gke.endpoint
# }

# output "client_token" {
#   sensitive = true
#   value     = base64encode(data.google_client_config.default.access_token)
# }

# output "ca_certificate" {
#       sensitive = true
#   value = module.gke.ca_certificate
# }

