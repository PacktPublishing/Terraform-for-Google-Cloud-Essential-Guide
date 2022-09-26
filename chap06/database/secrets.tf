resource "random_password" "root" {
  length  = 12
  special = false
}

resource "google_secret_manager_secret" "root_pw" {
  secret_id = "db-root-pw"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "root_pw" {
  secret      = google_secret_manager_secret.root_pw.id
  secret_data = random_password.root.result
}

resource "random_password" "user" {
  length  = 8
  special = false
}

resource "google_secret_manager_secret" "user_pw" {
  secret_id = "db-user-pw"
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "user_pw" {
  secret      = google_secret_manager_secret.user_pw.id
  secret_data = random_password.user.result
}
