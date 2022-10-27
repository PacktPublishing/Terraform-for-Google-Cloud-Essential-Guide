variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "network" {
  type = string
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

variable "subnets" {
  type = list(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
}


variable "services" {
  type = list(string)
}

variable "roles" {
  type = list(string)
}

variable "sa_name" {
  type = string
}


variable "vpc_connector_name" {
  type = string
}
