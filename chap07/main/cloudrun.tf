resource "google_cloud_run_service" "hello" {
  name     = "hello"
  location = var.region
  metadata {
    annotations = {
      "run.googleapis.com/ingress" = "internal-and-cloud-load-balancing"
    }
  }

  template {
    spec {
      containers {
        image = var.container_images.hello
      }
      service_account_name = data.terraform_remote_state.foundation.outputs.service_account_email
    }
  }
}

resource "google_cloud_run_service_iam_binding" "hello" {
  location = google_cloud_run_service.hello.location
  service  = google_cloud_run_service.hello.name
  role     = "roles/run.invoker"
  members = [
    "allUsers",
  ]
}

resource "google_cloud_run_service" "redis" {
  name = "redis"

  location = var.region
  metadata {
    annotations = {
      "run.googleapis.com/ingress" = "internal-and-cloud-load-balancing"
    }
  }
  template {
    metadata {
      annotations = {
        "run.googleapis.com/vpc-access-connector" = var.vpc_connector_name
        "run.googleapis.com/vpc-access-egress"    = "private-ranges-only"
      }
    }
    spec {
      containers {
        image = var.container_images.redis

        env {
          name = "REDIS_IP"
          value_from {
            secret_key_ref {
              name = data.terraform_remote_state.foundation.outputs.redis_ip_secret_id
              key  = "latest"
            }
          }
        }
      }
      service_account_name = data.terraform_remote_state.foundation.outputs.service_account_email
    }
  }
}

resource "google_cloud_run_service_iam_binding" "redis" {
  location = google_cloud_run_service.redis.location
  service  = google_cloud_run_service.redis.name
  role     = "roles/run.invoker"
  members = [
    "allUsers",
  ]
}
