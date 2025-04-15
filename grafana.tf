resource "azurerm_container_app" "grafana" {
  name = "grafana"
  container_app_environment_id = azurerm_container_app_environment.dev.id
  resource_group_name = azurerm_resource_group.monitoring.name
  revision_mode = "Single"

  template {
    container {
      cpu    = 0.5
      image  = "grafana/grafana:latest"
      memory = "1.0Gi"
      name   = "grafana"

      env {
        name  = "GF_SECURITY_ADMIN_PASSWORD"
        value = "admin" # 🔐 Change this!
      }
    }
  }
    ingress {
      external_enabled = true
      target_port = var.grafana_port
      transport = "auto"

      traffic_weight {
        percentage      = 100
        latest_revision = true
      }
    }
}
