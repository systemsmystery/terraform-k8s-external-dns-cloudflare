provider "kubernetes" {
  config_path            = var.cluster_configfile
  config_context_cluster = var.cluster_context
}

provider "kubectl" {
  config_path            = var.cluster_configfile
  config_context_cluster = var.cluster_context
}