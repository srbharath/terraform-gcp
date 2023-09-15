# Create a Cloud SQL instance
resource "google_sql_database_instance" "example" {
  name             = "my-instance1"
  database_version = "POSTGRES_12"
  region           = "us-central1"

  settings {
    tier = "db-f1-micro"
  }
}

# Create a database in the Cloud SQL instance
resource "google_sql_database" "example" {
  name     = "example-database"
  instance = google_sql_database_instance.example.name
}

# Create a Cloud Run service
resource "google_cloud_run_service" "example" {
  name     = "run-server123"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/imposing-voyage-392509/my-app5@sha256:b3e31360c48cec3995b416f97c1caacdc7d8ce3359d76f2df91f95188545d3e2"
      }
    }
  }
}

# Output the URL of the Cloud Run service
output "service_url" {
  value = google_cloud_run_service.example.status[0].url
}
