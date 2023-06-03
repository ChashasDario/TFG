variable "project-id" {
  type          = string
  description   = "Project ID for GCP"
  default       = "optimal-aurora-384414"
}

variable "region" {
  }


 variable "gke_username" {
  default     = "dario"
  description = "gke username"
}

variable "gke_password" {
  default     = "dario"
  description = "gke password"
}

variable "gke_num_nodes" {
  default     = 1
  description = "number of gke nodes"
}
variable "gke_name" {
  default = "dario-gke"  
}
variable "node_name" {
  default = "dario-gke-node"  
}
variable "vpc" {}
variable "subnet" {}
variable "rangopods" {
   default = "gke-pods"
}
variable "rangoservices" {
default = "gke-services"
}
/*
variable "mach_ty" {
  default = "g1-small"
}
*/

variable "mach_ty" {
  default = "e2-medium"
}
