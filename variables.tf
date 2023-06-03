variable "region" {
  type        = string
  description = "GCP region for resources"
  default     = "europe-west2"
  }
/*
variable "vm_names" {
  type        = list(string)
  default     = ["zero","uno","dos","tres","cuatro"]
  }*/
  variable "id" {
  default     = "optimal-aurora-384414"
  }
variable "cluster_name" {
  default = "dario-gke"  
}
variable "zone" {
  type        = string
  description = "GCP region for resources"
  default     = "europe-west2-b"
  }


  
