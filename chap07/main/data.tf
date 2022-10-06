data "terraform_remote_state" "foundation" {
  backend = "gcs"
  config = {
    bucket = "<PROJECT_ID>-tf-state"
    prefix = "chap07/foundation"
  }
}
