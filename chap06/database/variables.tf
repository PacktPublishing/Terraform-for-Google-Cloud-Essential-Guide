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

variable "database_version" {
  description = "The database version to use"
  type        = string
  default     = "MYSQL_8_0"
}

variable "database_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "default_user" {
  description = "mysql user name"
  default     = "default"
}

variable "name" {
  description = "The name of the Cloud SQL Instance"
  type        = string
  default     = "default"
}

variable "db_name" {
  description = "The name of the  database to create"
  type        = string
  default     = "default"
}

variable "db_user" {
  description = "The name of the user"
  type        = string
  default     = "user"
}

variable "db_settings" {
  description = "Map of the various DB Settings"
  type = map(any)
}