project_id = "<PROJECT_ID>"
network    = "cloudrun"
region     = "us-central1"

container_images = {
  "hello" = "gcr.io/terraform-for-gcp/hello"
  "redis" = "gcr.io/terraform-for-gcp/redis"
}

subnets = [
  {
    name          = "vpccon"
    region        = "us-central1"
    ip_cidr_range = "192.168.1.0/28"
  },
]

services = [
  "cloudbuild",
  "cloudresourcemanager",
  "compute",
  "iam",
  "redis",
  "run",
  "secretmanager",
  "servicenetworking",
  "sqladmin",
  "vpcaccess",
]


sa_name = "cloudrun"
roles   = ["secretmanager.secretAccessor", "run.invoker", "redis.editor"]

vpc_connector_name = "vpccon"