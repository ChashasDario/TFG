resource "kubernetes_manifest" "service_wordpress_service" {
  manifest = {
    "apiVersion" = "v1"
    "kind" = "Service"
    "metadata" = {
      "labels" = {
        "app" = "wordpress"
        "type" = "frontend"
      }
      "name" = "wordpress-service"
      "namespace" = "default" 

    }
    "spec" = {
      "ports" = [
        {
          "name" = "http-sv-port"
          "port" = 80
          "targetPort" = "http-port"
        },
        {
          "name" = "https-sv-port"
          "port" = 443
          "targetPort" = "https-port"
        },
      ]
      "selector" = {
        "app" = "wordpress"
        "type" = "frontend"
      }
      "type" = "NodePort"
    }
  }
}
