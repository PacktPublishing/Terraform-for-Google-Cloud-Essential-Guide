terraform {
  backend "gcs" {
    bucket = "<PROJECT_ID>-tf-state"
    prefix = "chap05/remote-state/cloud-sql"
  }
}
