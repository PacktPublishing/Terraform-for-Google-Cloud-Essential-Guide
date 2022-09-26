terraform {
  backend "gcs" {
    bucket = "soy-framing-362002-tf-state"
    prefix = "chap06/step3"
  }
}
