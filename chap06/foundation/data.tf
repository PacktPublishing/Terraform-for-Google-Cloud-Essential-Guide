data "google_netblock_ip_ranges" "iap_forwarders" {
  range_type = "iap-forwarders"
}

data "google_netblock_ip_ranges" "health_checkers" {
  range_type = "health-checkers"
}
