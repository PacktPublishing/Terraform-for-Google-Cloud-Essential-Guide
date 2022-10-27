resource "google_service_account" "this" {
  account_id   = var.service_account.name
  display_name = "${var.service_account.name} Service Account"
}

resource "google_project_iam_member" "this" {
  project = var.project_id
  count   = length(var.service_account.roles)
  role    = "roles/${var.service_account.roles[count.index]}"
  member  = "serviceAccount:${google_service_account.this.email}"
}
