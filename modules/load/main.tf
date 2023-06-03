resource "google_compute_global_network_endpoint_group" "external_proxy" {
    provider = google-beta
    name                  = "network-endpoint"
    network_endpoint_type = "INTERNET_FQDN_PORT"
    default_port          = "443"
}

resource "google_compute_global_network_endpoint" "proxy" {
  provider = google-beta
  project = var.id
  global_network_endpoint_group = google_compute_global_network_endpoint_group.external_proxy.id
  fqdn                          = "test.example.com"
  port                          = google_compute_global_network_endpoint_group.external_proxy.default_port
}

resource "google_compute_backend_service" "default" {
    provider = google-beta
    project = var.id
    name                            = "backend-service"
      enable_cdn                      = true
    timeout_sec                     = 10
    connection_draining_timeout_sec = 10

    custom_request_headers          = ["host: ${google_compute_global_network_endpoint.proxy.fqdn}"]
    custom_response_headers         = ["X-Cache-Hit: {cdn_cache_status}"]

    backend {
        group = google_compute_global_network_endpoint_group.external_proxy.id
     }
}
#####

resource "google_compute_target_http_proxy" "default" {
  name        = "dario_proxy"
  url_map     = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  name            = "mapa_dario"
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "dario_gfr"
  ip_address = google_compute_global_address.default.address
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
}

resource "google_compute_global_address" "default" {
  name = "global-ip"
}



/*#################NEG#############


resource "google_compute_network_endpoint_group" "external_proxy" {
  name         = "${var.neg_name}"
  #network_endpoint_type = "INTERNET_FQDN_PORT"
  network      = var.vpc
  subnetwork   = var.subnet
  default_port = var.def_port
  zone         = var.zone
}
############BACKEND###################

resource "google_compute_backend_service" "default" {
  name            = "backend-service"
  health_checks   = [google_compute_health_check.default.id] 
  load_balancing_scheme = "INTERNAL_SELF_MANAGED"
  backend {
    group = google_compute_network_endpoint_group.neg.self_link
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

resource "google_compute_health_check" "default" {
  name               = "health-check"
  timeout_sec        = 1
  check_interval_sec = 1
  tcp_health_check {
    port = 80
  }

}
############v1########
resource "google_compute_global_network_endpoint_group" "external_proxy" {
  provider = google-beta
  name                  = "network-endpoint"
  network_endpoint_type = "INTERNET_FQDN_PORT"
  default_port          = "443" 
  network      = var.vpc
  subnetwork   = var.subnet
  zone         = var.zone

###########v2####################

resource "google_compute_global_network_endpoint" "proxy" {
  provider = google-beta
  project = var.id
  global_network_endpoint_group = google_compute_network_endpoint_group.external_proxy.id
  fqdn                          = "test.example.com"
  port                          = google_compute_network_endpoint_group.external_proxy.default_port
}


resource "google_compute_backend_service" "default" {
  provider = google-beta
  name                            = "backend-service"
  enable_cdn                      = true
  timeout_sec                     = 10
  connection_draining_timeout_sec = 10

  custom_request_headers          = ["host: ${google_compute_global_network_endpoint.proxy.fqdn}"]
  custom_response_headers         = ["X-Cache-Hit: {cdn_cache_status}"]

  backend {
    group = google_compute_network_endpoint_group.external_proxy.id
  }
}

*/
###########FRONTEND######################
/*

resource "google_compute_target_http_proxy" "default" {
  name        = "dario_proxy"
  url_map     = google_compute_url_map.default.id
}

resource "google_compute_url_map" "default" {
  name            = "mapa_dario"
  default_service = google_compute_backend_service.default.id
}

resource "google_compute_global_forwarding_rule" "default" {
  name       = "dario_gfr"
  ip_address = google_compute_global_address.default.address
  target     = google_compute_target_http_proxy.default.self_link
  port_range = "80"
}

resource "google_compute_global_address" "default" {
  name = "global-ip"
}
*/