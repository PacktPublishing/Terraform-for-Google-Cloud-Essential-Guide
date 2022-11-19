locals {
  network_name = google_compute_network.this.name
}

resource "google_compute_network" "this" {
  depends_on              = [google_project_service.this["compute"]]
  name                    = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  project  = var.project_id
  for_each = { for subnet in var.subnets : subnet.name => subnet }
  network  = local.network_name

  name                     = each.value.name
  region                   = each.value.region
  ip_cidr_range            = each.value.ip_cidr_range
  private_ip_google_access = "true"
}
