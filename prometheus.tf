resource "azurerm_container_app" "prometheus" {
  name = "prometheus"
  container_app_environment_id = azurerm_container_app_environment.dev.id
  resource_group_name = azurerm_resource_group.monitoring.name
  revision_mode = "Single"

  template {
    container {
      cpu    = 0.5
      image  = "prom/prometheus:latest"
      memory = "1.0Gi"
      name   = "prometheus"
    }
  }
    ingress {
      external_enabled = true
      target_port = var.prometheus_port
      transport = "auto"

      traffic_weight {
        percentage      = 100
        latest_revision = true
      }
    }
}
