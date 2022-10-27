variable "project_id" {
  type        = string
  description = "ID of the Google Project"
}

variable "services" {
  description = "List of Services to be enabled"
  type        = list(string)
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
  type        = string
  description = "Name of the VPC network"
}

variable "subnets" {
  description = "List of the subnets"
  type = list(object({
    name          = string
    region        = string
    ip_cidr_range = string
  }))
}

variable "sa_name" {
  description = "Name of the service account to be created"
  type        = string
}

variable "roles" {
  description = "Name of the IAM roles to be assigned for the service account"
  type        = list(string)
}

