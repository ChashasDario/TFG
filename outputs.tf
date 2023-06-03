output "gke_endpoint" {
  value = module.gke.endpoint
}

output "gke_cluname" {
  value = module.gke.cluname
}

output "gke_nodename" {
  value = module.gke.nodename
}/*
output "load_balancer_ip" {
  value = module.load_balancer.ip_address
  description = "The IP address of the load balancer."
}
*/