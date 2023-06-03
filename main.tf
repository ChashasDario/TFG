terraform {
  backend "gcs" {
    bucket  = "dpmterraform-kubernetes"
    prefix  = "production/terraform.tfstate"
  }

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.4"
    }
  }

}
module "vpc" {
  source     = "./modules/vpc"
  project_id = var.id
  region     = var.region
}
module "gke" {
  source     = "./modules/gke"
  region     = var.region
  vpc = "${module.vpc.vpc.id}"
  subnet = "${module.vpc.subnet.id}"
}

module "manifest" {
  source     = "./modules/manifest/terraform2"
}

# Retrieve an access token as the Terraform runner
data "google_client_config" "provider" {}
#por si creo primeo el cluster con el target 

data "google_container_cluster" "primary" {
  name     = module.gke.cluname
  location = var.region
   project = var.id
}

data "google_client_config" "default" {}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.primary.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
}

##########LOAD############

module "load_balancer" {
  source     = "./modules/load"
  zone     = var.zone
  id     = var.id
  vpc = "${module.vpc.vpc.id}"
  subnet = "${module.vpc.subnet.id}"
}