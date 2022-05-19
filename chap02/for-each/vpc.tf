resource "google_compute_network" "this" {
  project                 = var.project_id
  name                    = var.network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "this" {
  # uncomment the next line for depends_on
  # depends_on               = [resource.google_compute_network.this]
  project                  = var.project_id
  for_each                 = var.subnets
  network                  = var.network
  name                     = each.key
  region                   = each.value["region"]
  ip_cidr_range            = each.value["ip_cidr_range"]
  private_ip_google_access = "true"
}
