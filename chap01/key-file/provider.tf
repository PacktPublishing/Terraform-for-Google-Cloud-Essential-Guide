terraform {
  required_version = "~> 1.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.29"
    }
  }
}

provider "google" {
  project     = "<PROJECT_ID>"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = "./terraform.json"
}