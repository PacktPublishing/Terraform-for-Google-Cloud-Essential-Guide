resource "google_compute_region_network_endpoint_group" "api" {
  name                  = "cloud-run"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run {
    url_mask = "/api/<service>"
  }
}

resource "google_compute_backend_service" "api" {
  name                  = "cloud-run"
  load_balancing_scheme = "EXTERNAL"
  port_name             = "http"

  backend {
    group = google_compute_region_network_endpoint_group.api.self_link
  }
}

resource "google_compute_global_forwarding_rule" "this" {
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL"
  name                  = "cloud-run"
  port_range            = "80-80"
  target                = google_compute_target_http_proxy.this.self_link
}

resource "google_compute_target_http_proxy" "this" {
  name    = "cloud-run"
  url_map = google_compute_url_map.this.self_link
}

resource "google_compute_backend_bucket" "static_content" {
  name        = "static-content"
  description = "Contains all static content"
  bucket_name = google_storage_bucket.static.name
  enable_cdn  = false
}

resource "google_compute_url_map" "this" {
  name = "cloud-run"

  default_service = google_compute_backend_bucket.static_content.self_link
  host_rule {
    hosts        = ["*"]
    path_matcher = "path-matcher-1"
  }

  path_matcher {
    default_service = google_compute_backend_bucket.static_content.self_link
    name            = "path-matcher-1"
    path_rule {
      paths   = ["/api/*"]
      service = google_compute_backend_service.api.self_link
    }
  }
}
