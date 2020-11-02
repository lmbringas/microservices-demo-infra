output "cluster_ip" {
  description = "The loadbalancer ip."
  value       = digitalocean_loadbalancer.public.ip
}

output "kubeconfig" {
  description = "Kubeconfig."
  value       = base64encode(digitalocean_kubernetes_cluster.cluster.kube_config.0.raw_config)
}