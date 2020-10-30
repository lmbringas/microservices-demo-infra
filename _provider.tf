provider "digitalocean" {
  token = var.digitalocean_token
}

provider "kubernetes" {
  config_path = local_file.kubernetes_config.filename
}

provider "circleci" {
  api_token    = var.circleci_token
  vcs_type     = "github"
  organization = "lmbringas"
}
