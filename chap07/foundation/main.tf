# locals {
#   network_name = google_compute_network.this.name
# }

# resource "google_compute_network" "this" {
#   name                    = var.network
#   auto_create_subnetworks = false
# }

# resource "google_compute_subnetwork" "this" {
#   project  = var.project_id
#   for_each = { for subnet in var.subnets : subnet.name => subnet }
#   network  = local.network_name

#   name                     = each.value.name
#   region                   = each.value.region
#   ip_cidr_range            = each.value.ip_cidr_range
#   private_ip_google_access = "true"
# }

# resource "google_compute_firewall" "allow_iap" {
#   name    = "${local.network_name}-allow-iap"
#   network = local.network_name

#   allow {
#     protocol = "tcp"
#     ports    = ["22"]
#   }

#   source_ranges = data.google_netblock_ip_ranges.iap_forwarders.cidr_blocks_ipv4
#   target_tags   = ["allow-iap"]
# }

# resource "google_compute_firewall" "allow_health_check" {
#   name    = "${local.network_name}-allow-health-check"
#   network = local.network_name
#   allow {
#     protocol = "tcp"
#     ports    = ["80"]
#   }

#   source_ranges = data.google_netblock_ip_ranges.health_checkers.cidr_blocks_ipv4
#   target_tags   = ["allow-health-check"]
# }