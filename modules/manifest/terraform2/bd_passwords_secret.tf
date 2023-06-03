resource "kubernetes_manifest" "secret_bd_passwords" {
  manifest = {
    "apiVersion" = "v1"
    "data" = {
      "bd_password" = "cGFzc3dvcmQxMjM0"
      "bd_rootpassword" = "cm9vdDEyMzQ="
    }
    "kind" = "Secret"
    "metadata" = {
      "creationTimestamp" = null
      "name" = "bd-passwords"
      "namespace" = "default" 
    }
  }
}
