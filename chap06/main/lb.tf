resource "google_compute_global_forwarding_rule" "this" {
  name                  = var.load_balancer.forward_rule_name
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.this.self_link
}

resource "google_compute_health_check" "this" {
  name = "http-health-check"
  http_health_check {
    port = 80
  }
}

resource "google_compute_backend_service" "this" {
  name                  = var.load_balancer.backend_service_name
  health_checks         = [google_compute_health_check.this.self_link]
  load_balancing_scheme = "EXTERNAL"

  backend {
    balancing_mode = "UTILIZATION"
    group          = google_compute_region_instance_group_manager.this.instance_group
  }
}

# #
resource "google_compute_url_map" "this" {
  name            = var.load_balancer.url_map_name
  default_service = google_compute_backend_service.this.self_link
}

resource "google_compute_target_http_proxy" "this" {
  name    = var.load_balancer.target_proxy_name
  url_map = google_compute_url_map.this.self_link
}
