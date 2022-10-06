terraform {
  backend "gcs" {
    bucket = "<PROJECT_ID>-tf-state"
    prefix = "chap06/database"
  }
}
