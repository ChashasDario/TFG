
# GKE cluster
resource "google_container_cluster" "primary" {
  name     = var.gke_name
  location = var.region
  project = var.project-id
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc
  subnetwork = var.subnet
  ip_allocation_policy {
    cluster_secondary_range_name  = var.rangopods
    services_secondary_range_name = var.rangoservices
  }
}

# Separately Managed Node Pool
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.node_name}"
  cluster    = google_container_cluster.primary.name
  node_count = var.gke_num_nodes
  project = var.project-id
  location = var.region

  node_config {
    preemptible = true

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels = {
      env = var.project-id
    }
    
    machine_type = var.mach_ty
    tags         = ["gke-node", "${var.project-id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
    disk_type = "pd-standard"
  }
}
