resource "azurerm_service_plan" "service_plan" {
  name                = "sp-anssihakanen-terraform"
  resource_group_name = var.rg
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_function_app" "function_app" {
  name                       = "fa-anssihakanen-terraform"
  location                   = var.location
  resource_group_name      = var.rg
  service_plan_id            = azurerm_service_plan.service_plan.id
  storage_account_name       = var.sa.name
  storage_account_access_key = var.sa.primary_access_key

  site_config {}
}