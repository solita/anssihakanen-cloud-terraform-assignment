#resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
#  name                = "law-anssihakanen-asd"
#  location            = var.location
#  resource_group_name = var.rg
#  sku                 = "PerGB2018"
#  retention_in_days   = 7
#}

#resource "azurerm_container_app" "app" {
#  name                         = "cont-app-anssihakanen-asd"
#  resource_group_name          = var.rg
#  revision_mode                = "Single"
#
#  template {
#    container {
#      name   = "app-clamav"
#      image  = "https://hub.docker.com/r/clamav/clamav:latest"
#      cpu    = 0.25
#      memory = "0.5Gi"
#    }
#  }
#}