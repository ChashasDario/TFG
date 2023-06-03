resource "kubernetes_manifest" "configmap_bd_datos" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "bd_dbname" = "wordpress"
      "bd_user" = "user_wordpress"
    }
    "kind" = "ConfigMap"
    "metadata" = {
      "creationTimestamp" = null
      "name" = "bd-datos"
      "namespace" = "default" 
    }
  }
}
