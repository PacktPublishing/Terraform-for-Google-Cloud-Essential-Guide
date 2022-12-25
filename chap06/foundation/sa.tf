resource "google_service_account" "this" {
  depends_on   = [google_project_service.this["iam"]]
  account_id   = var.sa_name
  display_name = "${var.sa_name} Service Account"
}

resource "google_project_iam_member" "this" {
  project = var.project_id
  count   = length(var.roles)
  role    = "roles/${var.roles[count.index]}"
  member  = "serviceAccount:${google_service_account.this.email}"
}