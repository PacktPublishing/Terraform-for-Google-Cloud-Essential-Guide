terraform {
  backend "gcs" {
    bucket = "tf-gcp-01-tf-state"
    prefix = "chap05/workspaces"
  }
}
