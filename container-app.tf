resource "azurerm_resource_group" "monitoring" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_log_analytics_workspace" "log" {
  name                = "${var.prefix}-log"
  location            = azurerm_resource_group.monitoring.location
  resource_group_name = azurerm_resource_group.monitoring.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "dev" {
  name                       = "dev"
  location                   = azurerm_resource_group.monitoring.location
  resource_group_name        = azurerm_resource_group.monitoring.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log.id
}