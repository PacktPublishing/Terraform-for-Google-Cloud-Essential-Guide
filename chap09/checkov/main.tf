resource "google_storage_bucket" "this" {
  location                    = var.region
  name                        = "${var.project_id}-sample-bucket"
  uniform_bucket_level_access = true

  #checkov:skip=CKV_GCP_62: "No logging required"
}
