terraform {
 # Definition des verwendeten Terraform-Providers
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}
# Konfiguration des Google Cloud Providers
provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}
# Erstellung des Google Kubernetes Engine (GKE)-Clusters
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.zone
# Deaktivierung des Löschschutzes, damit der Cluster später 
# mit Terraform wieder entfernt werden kann
deletion_protection = false 
# Entfernt den automatisch erzeugten Standard-Node-Pool
  remove_default_node_pool = true
# Temporärer Node für die Clustererstellung
  initial_node_count       = 1
}
# Erstellung eines eigenen Node-Pools für den Cluster
resource "google_container_node_pool" "primary_nodes" {
  name       = "terraform-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
# Verwendeter Maschinentyp der Worker-Nodes
    machine_type = var.machine_type
# Größe der Boot-Festplatte
    disk_size_gb = var.disk_size_gb
# Berechtigungen für den Zugriff auf Google-Cloud Dienste
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
