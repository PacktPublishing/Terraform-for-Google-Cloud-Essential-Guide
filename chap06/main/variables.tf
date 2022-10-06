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

# variable "machine_type" {
#   type        = string
#   description = "Machine Type"
#   default     = "e2-micro"
# }

# variable "source_image" {
#   type        = string
#   description = "Source Image"
# }

variable "load_balancer" {
  type = map(any)
}

variable "mig" {
  type = map(any)
}