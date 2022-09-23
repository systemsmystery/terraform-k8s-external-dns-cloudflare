resource "kubernetes_cluster_role_binding" "external_dns" {
  metadata {
    name = "external-dns-${replace(var.domain, ".", "-")}"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.external_dns.metadata[0].name
  }
  subject {
    kind = "ServiceAccount"
    name = kubernetes_service_account.external_dns.metadata[0].name
  }
}