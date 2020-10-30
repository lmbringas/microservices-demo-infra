output "lb_ip" {
  description = "The loadbalancer ip."
  value       = digitalocean_loadbalancer.public.ip
}