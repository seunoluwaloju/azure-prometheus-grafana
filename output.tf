output "prometheus_url" {
  description = "Public URL of the Prometheus Container App"
  value       = "https://${azurerm_container_app.prometheus.ingress[0].fqdn}"
}

output "grafana_url" {
  description = "Public URL of the Grafana Container App"
  value       = "https://${azurerm_container_app.grafana.ingress[0].fqdn}"
}