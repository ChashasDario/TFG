output "endpoint" {
  value = google_container_cluster.primary.endpoint
}

output "cluname" {
  value = google_container_cluster.primary.name
}

output "nodename" {
  value = google_container_node_pool.primary_nodes.name
}