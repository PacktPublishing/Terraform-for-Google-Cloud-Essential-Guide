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


variable "db_settings" {
  description = "Map of the various DB Settings"
  type        = map(any)
}