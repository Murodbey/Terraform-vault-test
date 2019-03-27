resource "kubernetes_deployment" "vault" {
  metadata {
    name      = "vault"
    namespace = "tools"

    labels {
      app = "vault"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels {
        app = "vault-pod"
      }
    }

    template {
      metadata {
        labels {
          app = "vault-pod"
        }
      }

      spec {
        container {
          image = "vault"
          name  = "vault"

          resources {
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }

            env {
              name  = "VAULT_DEV_ROOT_TOKEN_ID"
              value = "vault-root-token"
            }
          }
        }
      }
    }
  }
}
