terraform {
  backend "gcs" {
    bucket = "<PROJECT_ID>-tf-state"
    prefix = "chap04/local-module"
  }
}
