resource "kubernetes_cluster_role" "external_dns" {
  metadata {
    name = "external-dns-${replace(var.domain, ".", "-")}"
  }
  rule {
    api_groups = ["extensions", "networking.k8s.io"]
    resources  = ["ingresses"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["services", "endpoints", "pods"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = [""]
    resources  = ["nodes"]
    verbs      = ["list", "watch"]
  }
  rule {
    api_groups = ["externaldns.k8s.io"]
    resources  = ["dnsendpoints"]
    verbs      = ["list", "watch", "update"]
  }
  rule {
    api_groups = ["externaldns.k8s.io"]
    resources  = ["dnsendpoints/status"]
    verbs      = ["update"]
  }
}