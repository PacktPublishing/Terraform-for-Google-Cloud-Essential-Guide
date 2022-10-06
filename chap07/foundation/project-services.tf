resource "google_project_service" "this" {
  count              = length(var.services)
  service            = "${var.services[count.index]}.googleapis.com"
  disable_on_destroy = false
}
