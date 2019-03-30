resource "kubernetes_secret" "vault_secret" {
  metadata {
    name      = "vault-secret"
    namespace = "test"
  }
  data {
    password = "TXlWM3J5UzNjdXJlUGFzU3dE"
  }
  type = "Opaque"
}