resource "kubernetes_manifest" "deployment_wordpress_deployment" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "wordpress"
        "type" = "frontend"
      }
      "name" = "wordpress-deployment"
      "namespace" = "default" 

    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "wordpress"
          "type" = "frontend"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "wordpress"
            "type" = "frontend"
          }
        }
        "spec" = {
          "containers" = [
            {
              "env" = [
                {
                  "name" = "WORDPRESS_DB_HOST"
                  "value" = "mariadb-service"
                },
                {
                  "name" = "WORDPRESS_DB_USER"
                  "valueFrom" = {
                    "configMapKeyRef" = {
                      "key" = "bd_user"
                      "name" = "bd-datos"
                    }
                  }
                },
                {
                  "name" = "WORDPRESS_DB_PASSWORD"
                  "valueFrom" = {
                    "secretKeyRef" = {
                      "key" = "bd_password"
                      "name" = "bd-passwords"
                    }
                  }
                },
                {
                  "name" = "WORDPRESS_DB_NAME"
                  "valueFrom" = {
                    "configMapKeyRef" = {
                      "key" = "bd_dbname"
                      "name" = "bd-datos"
                    }
                  }
                },
              ]
              "image" = "wordpress"
              "name" = "contenedor-wordpress"
              "ports" = [
                {
                  "containerPort" = 80
                  "name" = "http-port"
                },
                {
                  "containerPort" = 443
                  "name" = "https-port"
                },
              ]
              "volumeMounts" = [
                {
                  "mountPath" = "/var/www/html"
                  "name" = "wordpress-vol"
                },
              ]
            },
          ]
          "volumes" = [
            {
              "name" = "wordpress-vol"
              "persistentVolumeClaim" = {
                "claimName" = "wordpress-pvc"
              }
            },
          ]
        }
      }
    }
  }
}
