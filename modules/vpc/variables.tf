variable "project_id" {}
variable "region" {}
variable "red_name" {
    default = "reddario"
}
variable "subred_name" {
    default = "subreddario"
}
variable "red_range"{
    default = "10.10.0.0/24"
}
variable "service_range" {
  default = "10.141.0.0/20"
}
variable "pods_range" {
    default = "10.136.0.0/14"
}
variable "gke-services" {
    default = "gke-services"
}
variable "gke-pods" {
    default = "gke-pods"
}