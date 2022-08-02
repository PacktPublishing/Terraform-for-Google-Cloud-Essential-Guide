variable "name" {
  type = string
}

variable "zone" {
  type    = string
  default = "us-central1-b"
}

variable "static_ip" {
  type    = bool
  default = true
}

variable "machine_size" {
  type    = string
  default = "small"
  validation {
    condition     = contains(["small", "medium", "large"], var.machine_size)
    error_message = "The machine size must be one of small, medium, and large."
  }
}

variable "environment" {
  type        = string
  description = "Type of environment"
  default     = "dev"
}
