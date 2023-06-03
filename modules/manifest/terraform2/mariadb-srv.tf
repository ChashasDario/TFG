resource "kubernetes_manifest" "service_mariadb_service" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "wordpress"
        "type" = "database"
      }
      "name" = "mariadb-service"
      "namespace" = "default" 

    }
    "spec" = {
      "ports" = [
        {
          "port" = 3306
          "targetPort" = "db-port"
        },
      ]
      "selector" = {
        "app" = "wordpress"
        "type" = "database"
      }
      "type" = "ClusterIP"
    }
  }
}
