resource "digitalocean_kubernetes_cluster" "cluster" {
  name    = var.cluster_name
  region  = "nyc1"
  version = "1.19.3-do.1"

  node_pool {
    name       = var.cluster_nodes_name
    size       = "s-2vcpu-2gb"
    node_count = 2
    tags       = [var.cluster_nodes_name]
  }
}

resource "kubernetes_namespace" "shop_namespace" {
  metadata {
    name = "sock-shop"
  }
}

resource "digitalocean_loadbalancer" "public" {
  name   = "loadbalancer-1"
  region = "nyc1"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 30001
    target_protocol = "http"
  }

  healthcheck {
    port     = 30001
    protocol = "tcp"
  }

  droplet_tag = "prod-nodes"
}

resource "local_file" "kubernetes_config" {
  content  = digitalocean_kubernetes_cluster.cluster.kube_config.0.raw_config
  filename = "${var.kubeconfig_name}.yml"

}

resource "null_resource" "deploy" {
  provisioner "local-exec" {
    command = "kubectl --kubeconfig=${var.kubeconfig_name}.yml apply -f deploy.yml"
  }
  depends_on = [local_file.kubernetes_config]
}
