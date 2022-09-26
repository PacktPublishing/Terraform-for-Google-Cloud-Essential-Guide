data "terraform_remote_state" "layer1" {
  backend = "gcs"
  config = {
    bucket = "soy-framing-362002-tf-state"
    prefix = "chap06/layer1"
  }
}
