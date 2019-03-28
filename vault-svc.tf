resource "kubernetes_service" "vault_service" {
  metadata {
    name      = "vault-service"
    namespace = "test"
  }
  
  spec {
    selector { app = "vault-deployment"
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = 8200
    }
    type = "LoadBalancer"
  }
}