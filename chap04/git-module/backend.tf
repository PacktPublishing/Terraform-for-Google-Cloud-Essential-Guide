terraform {
  backend "gcs" {
    bucket = "causal-calculus-366901-tf-state"
    prefix = "chap04/git-module"
  }
}
