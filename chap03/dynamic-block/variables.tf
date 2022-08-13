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

variable "server_name" {
  type        = string
  description = "Name of Webserver"
}

variable "machine_type" {
  type        = string
  description = "Machine Type"
  default     = "e2-micro"
}

variable "disks" {
  type = map(object({
    type = string
    size = number
    mode = string
  }))
}
