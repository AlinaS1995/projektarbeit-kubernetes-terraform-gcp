# Ausgabe des Namens des erstellten Kubernetes-Clusters
output "cluster_name" {
  description = "Name des GKE-Clusters"
  value       = google_container_cluster.primary.name
}
# Ausgabe der Zone des bereitgestellten Clusters
output "cluster_location" {
  description = "Zone des GKE-Clusters"
  value       = google_container_cluster.primary.location
}
# Ausgabe des erstellten Node-Pools
output "node_pool_name" {
  description = "Name des Node Pools"
  value       = google_container_node_pool.primary_nodes.name
}
