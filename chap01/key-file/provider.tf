provider "google" {
  project     = "<PROJECT_ID>"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = "./terraform.json"
}