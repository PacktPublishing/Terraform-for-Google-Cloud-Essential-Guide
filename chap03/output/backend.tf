terraform {
  backend "gcs" {
    bucket = "<PROJECT_ID>-tf-state"
    prefix = "chap03/output"
  }
}
