resource "random_string" "this" {
  length  = 4
  special = false
  upper   = false
}

resource "google_sql_database_instance" "main" {
  name                = "main-instance-${random_string.this.result}"
  database_version    = "POSTGRES_11"
  region              = var.region
  deletion_protection = false

  settings {
    tier = "db-f1-micro"
  }
}