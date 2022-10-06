resource "random_string" "this" {
  length  = 4
  upper   = false
  special = false
}

resource "google_sql_database_instance" "this" {
  name             = "${var.db_settings.instance_name}-${random_string.this.result}"
  database_version = var.db_settings.database_version
  region           = var.region
  root_password    = random_password.root.result

  settings {
    tier = var.db_settings.database_tier
  }
  deletion_protection = false
}

resource "google_sql_database" "this" {
  name     = var.db_settings.db_name
  instance = google_sql_database_instance.this.name
}

resource "google_sql_user" "sql" {
  name     = var.db_settings.user_name
  instance = google_sql_database_instance.this.name
  password = random_password.user.result
}

resource "google_secret_manager_secret" "connection_name" {
  secret_id = "connection-name"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "connection_name" {
  secret      = google_secret_manager_secret.connection_name.id
  secret_data = google_sql_database_instance.this.connection_name
}