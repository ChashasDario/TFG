resource "kubernetes_manifest" "deployment_mariadb_deployment" {
  manifest = {
    "apiVersion" = "apps/v1"
    "kind" = "Deployment"
    "metadata" = {
      "labels" = {
        "app" = "wordpress"
        "type" = "database"
      }
      "name" = "mariadb-deployment"
      "namespace" = "default" 

      
    }
    "spec" = {
      "replicas" = 1
      "selector" = {
        "matchLabels" = {
          "app" = "wordpress"
          "type" = "database"
        }
      }
      "template" = {
        "metadata" = {
          "labels" = {
            "app" = "wordpress"
            "type" = "database"
          }
        }
        "spec" = {
          "containers" = [
            {
              "env" = [
                {
                  "name" = "MYSQL_USER"
                  "valueFrom" = {
                    "configMapKeyRef" = {
                      "key" = "bd_user"
                      "name" = "bd-datos"
                    }
                  }
                },
                {
                  "name" = "MYSQL_DATABASE"
                  "valueFrom" = {
                    "configMapKeyRef" = {
                      "key" = "bd_dbname"
                      "name" = "bd-datos"
                    }
                  }
                },
                {
                  "name" = "MYSQL_PASSWORD"
                  "valueFrom" = {
                    "secretKeyRef" = {
                      "key" = "bd_password"
                      "name" = "bd-passwords"
                    }
                  }
                },
                {
                  "name" = "MYSQL_ROOT_PASSWORD"
                  "valueFrom" = {
                    "secretKeyRef" = {
                      "key" = "bd_rootpassword"
                      "name" = "bd-passwords"
                    }
                  }
                },
              ]
              "image" = "mariadb"
              "name" = "contenedor-mariadb"
              "ports" = [
                {
                  "containerPort" = 3306
                  "name" = "db-port"
                },
              ]
            },
          ]
        }
      }
    }
  }
}
