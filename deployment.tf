resource "kubernetes_deployment" "external_dns" {
  metadata {
    name = "external-dns-${replace(var.domain, ".", "-")}"
  }
  spec {
    replicas = 1
    strategy {
      type = "Recreate"
    }
    selector {
      match_labels = {
        app = "external-dns-${replace(var.domain, ".", "-")}"
      }
    }
    template {
      metadata {
        labels = {
          app = "external-dns-${replace(var.domain, ".", "-")}"
        }
      }
      spec {
        service_account_name = kubernetes_service_account.external_dns.metadata.0.name
        container {
          name  = "external-dns"
          image = "k8s.gcr.io/external-dns/external-dns:v0.12.2"
          args = [
            "--source=ingress",
            "--source=crd",
            "--domain-filter=${var.domain}",
            "--provider=cloudflare",
            "--zone-id-filter=${var.zone_id_filter}",
            "--log-level=${var.log_level}",
          ]

          env {
            name  = "CF_API_EMAIL"
            value = var.cf_api_email
          }
          env {
            name  = "CF_API_KEY"
            value = var.cf_api_key
          }
        }
      }
    }
  }
}