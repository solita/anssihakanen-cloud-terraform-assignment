
resource "azurerm_linux_function_app" "function_app" {
  name                = "function_app-anssihakanen"
  resource_group_name = var.rg
  location            = var.location

  storage_account_name       = var.sa
  storage_account_access_key = azurerm_storage_account.example.primary_access_key
  service_plan_id            = azurerm_service_plan.example.id

  site_config {}
}