resource "google_storage_bucket" "static" {
  name                        = "${var.project_id}-static"
  location                    = var.region
  uniform_bucket_level_access = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket  = google_storage_bucket.static.name
  role    = "roles/storage.objectViewer"
  members = ["allUsers", ]
}


resource "google_storage_bucket_object" "index" {
  name          = "index.html"
  source        = "../static/index.html"
  bucket        = google_storage_bucket.static.name
  cache_control = "no-store"
}

resource "google_storage_bucket_object" "four_0_four" {
  name          = "404.html"
  source        = "../static/404.html"
  bucket        = google_storage_bucket.static.name
  cache_control = "no-store"
}


# resource "google_storage_bucket_object" "celebration" {
#   name   = "assets/celebration.svg"
#   source = "../static/celebration.svg"
#   # content        = "../assets/celebration.svg"
#   bucket        = google_storage_bucket.static.name
#   cache_control = "no-store"
# }

# resource "google_storage_bucket_object" "dark_celebration" {
#   name   = "assets/celebration-dark.svg"
#   source = "../static/celebration.svg"
#   # content        = "../assets/celebration.svg"
#   bucket        = google_storage_bucket.static.name
#   cache_control = "no-store"
# }