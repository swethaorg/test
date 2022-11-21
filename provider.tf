provider "google" {
    credentials = file("Credentials.json")
    project   = var.project_id
    region    = var.region
    zone      = var.zone
}