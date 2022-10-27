variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "region" {
  type        = string
  description = "Default Region"
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "Default Zone"
  default     = "us-central1-a"
}

variable "network" {
  type = object({
    name                = string
    subnetwork_name     = string
    nodes_cidr_range    = optional(string, "10.128.0.0/20")
    pods_cidr_range     = optional(string, "10.4.0.0/14")
    services_cidr_range = optional(string, "10.8.0.0/20")
  })
}

variable "gke" {
  type = object({
    name     = string
    regional = optional(bool, false)
    zones    = list(string)
  })
}

variable "node_pool" {
  type = object({
    name               = string
    machine_type       = optional(string, "e2-small")
    spot               = optional(bool, true)
    initial_node_count = optional(number, 2)
    max_count          = optional(number, 4)
    disk_size_gb       = optional(number, 10)
  })
}

variable "service_account" {
  type = object({
    name  = string
    roles = list(string)
  })
}

variable "services" {
  type = list(string)
  default = [
    "cloudresourcemanager",
    "compute",
    "container",
    "iam",
    "servicenetworking",

  ]
}