variable "digitalocean_token" {}

variable "cluster_name" {
  description = "Cluster name"
  default     = "prod"
  type        = string

}

variable "cluster_nodes_name" {
  description = "Node name"
  default     = "prod-node"
  type        = string
}

variable "kubeconfig_name" {
  description = "kubeconfig file name"
  default     = "kubeconfig"
  type        = string
}