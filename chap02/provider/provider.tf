provider "google" {
  region  = var.region
  zone    = var.zone
}

provider "google-beta" {
  region  = var.region
  zone    = var.zone
}