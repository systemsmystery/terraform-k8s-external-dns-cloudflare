variable "domain" {
  description = "The domain to use for this version of external dns"
}

variable "log_level" {
  default = "info"
  description = "The log level to use for external dns"
}

variable "zone_id_filter" {
  description = "The zone id filter to use for cloudflare external dns"
}

variable "cf_api_email" {
  description = "The cloudflare api email to use for external dns"
}

variable "cf_api_key" {
  description = "The cloudflare api key to use for external dns"
}

variable "cluster_configfile" {
  description = "The path to the cluster config file"
  default     = "~/.kube/config"
}

variable "cluster_context" {
  description = "The cluster context"
}