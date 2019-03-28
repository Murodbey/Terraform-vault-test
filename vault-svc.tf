resource "kubernetes_service" "vault_service" {
  metadata {
    name      = "vault-service"
    namespace = "test"
    labels {
      app = "vault-deployment"
    }
  }
  spec {
    port {
      name        = "vault"
      port        = 80
      target_port = 8200
    }
    type = "LoadBalancer"
  }
}