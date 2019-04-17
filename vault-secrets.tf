# resource "kubernetes_secret" "vault_secret" {
#   metadata {
#     name      = "vault-secret"
#     namespace = "test"
#   }
#   data {
#     password = "MyV3ryS3curePasSwD"
#   }
#   type = "Opaque"
# }