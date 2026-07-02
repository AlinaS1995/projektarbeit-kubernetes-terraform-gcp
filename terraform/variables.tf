
# Projektparameter der Google Cloud Platform
variable "project_id" {
  description = "Google Cloud Projekt-ID"
  type        = string
  default     = "pa-kubernetes-terraform-gcp"
}
# Region der Bereitstellung
variable "region" {
  description = "Google Cloud Region"
  type        = string
  default     = "europe-west3"
}
# Zone für den Kubernetes-Cluster
variable "zone" {
  description = "Google Cloud Zone"
  type        = string
  default     = "europe-west3-b"
}
# Anzahl der Worker-Nodes
variable "node_count" {
  description = "Anzahl der Worker-Nodes"
  type        = number
  default     = 3
}
# Größe der Boot-Festplatte pro Node
variable "disk_size_gb" {
  description = "Größe des Bootlaufwerks je Node in GB"
  type        = number
  default     = 20
}
# Name des Kubernetes-Clusters
variable "cluster_name" {
  description = "Name des GKE-Clusters"
  type        = string
  default     = "terraform-gke-cluster"
}
# Maschinentyp der Worker-Nodes
variable "machine_type" {
  description = "Maschinentyp der Worker-Nodes"
  type        = string
  default     = "e2-small"
}
