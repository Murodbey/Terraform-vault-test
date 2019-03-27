resource "kubernetes_service" "vault-svs" {
  metadata {
    name = "vault-svs"
    namespace = "tools"
  }

  spec {
    selector { app = "vault-pod"  }

    port {
      protocol = "TCP"
      port        = 80
      target_port = 8200
    }

    type = "LoadBalancer"
  }
}