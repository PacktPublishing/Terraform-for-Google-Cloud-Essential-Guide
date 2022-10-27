project_id = "<PROJECT_ID>"
region     = "us-west1"
zone       = "us-west1-a"

network = {
  name            = "dev-gke-network"
  subnetwork_name = "us-west1"
}

gke = {
  name  = "dev-gke-cluster"
  zones = ["us-west1-a"]
}

node_pool = {
  name         = "dev-node-pool"
  machine_type = "e2-standard-2"
}

service_account = {
  name  = "dev-sa"
  roles = []
}

# services = [
#   "cloudresourcemanager",
#   "compute",
#   "iam",
#   "servicenetworking",
#   "container"
# ]