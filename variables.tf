variable "digitalocean_token" {}
variable "circleci_token" {}
variable "kubeconfig_name" {
  description = "kubeconfig file name"
  default     = "kubeconfig"
  type        = string
}