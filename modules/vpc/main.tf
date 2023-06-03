resource "google_compute_network" "vpc" {
  name                    = "${var.red_name}"
  project                 = var.project_id
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  name          = "${var.subred_name}"
  ip_cidr_range = "${var.red_range}"
  region = var.region
  project       = var.project_id
  network       = google_compute_network.vpc.id
secondary_ip_range {
    range_name    = var.gke-services
    ip_cidr_range = var.service_range
  }
  secondary_ip_range {
    range_name    = var.gke-pods
    ip_cidr_range = var.pods_range
  }
}