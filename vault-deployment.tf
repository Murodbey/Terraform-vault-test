resource "kubernetes_persistent_volume_claim" "vault_pvc" {
  metadata {
    name      = "vault-pvc"
    namespace = "test"
    labels {
      app = "vault-deployment"
    }
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests {
        storage = "10Gi"
      }
    }
  }
}
resource "kubernetes_deployment" "vault" {
  metadata {
    name      = "vault"
    namespace = "test"
    labels {
      app = "vault-deployment"
    }
  }
  spec {
    replicas = 1

    selector {
      match_labels {
        app = "vault-deployment"
      }
    }

    template {
      metadata {
        labels {
          app = "vault-deployment"
        }
      }

      spec {
        volume {
          name = "vault-pvc"
          persistent_volume_claim {
            claim_name = "vault-pvc"
          }
        }
        container {
          name  = "vault"
          image = "vault"
          port {
            container_port = 8200
            protocol       = "TCP"
          }
          env {
            name  = "vault_token"
            value = "${var.vault_token}"
          }
          
          # env_from {
          #   secret_ref {
          #     name = "fuchicorp-secret"
          #    }
          #   }

          volume_mount {
            name       = "vault-pvc"
            mount_path = "/var/run/vault"
          }
        }
      }
    }
  }
}
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
