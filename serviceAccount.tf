resource "kubernetes_service_account" "external_dns" {
  metadata {
    name = "external-dns-${replace(var.domain, ".", "-")}"
  }
}