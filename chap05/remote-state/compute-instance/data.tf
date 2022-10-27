data "terraform_remote_state" "cloud_sql" {
  backend = "gcs"
  config = {
    bucket = "<PROJECT_ID>-tf-state"
    prefix = "chap05/remote-state/cloud-sql"
  }
}

# For Illustration only
output "connection_name" {
  value = data.terraform_remote_state.cloud_sql.outputs.connection_name
}