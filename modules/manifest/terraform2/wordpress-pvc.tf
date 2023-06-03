resource "kubernetes_manifest" "persistentvolumeclaim_wordpress_pvc" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "PersistentVolumeClaim"
    "metadata" = {
      "name" = "wordpress-pvc"
      "namespace" = "default" 

    }
    "spec" = {
      "accessModes" = [
        "ReadWriteOnce",
      ]
      "resources" = {
        "requests" = {
         # "storage" = "5Gi"
          "storage" = "500Mi"
        }
      }
    }
  }
}
