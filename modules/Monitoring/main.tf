resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = "law-anssihakanen-terraform"
  location            = var.location
  resource_group_name = var.rg
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_application_insights" "application_insights" {
  name                = "appinsight-anssihakanen-terraform"
  location            = var.location
  resource_group_name = var.rg
  workspace_id        = azurerm_log_analytics_workspace.log_analytics_workspace.id
  application_type    = "web"
}