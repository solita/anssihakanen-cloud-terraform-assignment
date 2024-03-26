data "azurerm_key_vault" "key_vault" {
  name = "kvacademy2024anssi"
  resource_group_name = "rg-academy2024-anssihakanen"
}
data "azurerm_key_vault_secret" "dbuser" {
  name = "dbuser"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
data "azurerm_key_vault_secret" "dbpass" {
  name = "dbpass"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}
resource "azurerm_mssql_server" "sql_server" {
  name                         = "sql-anssihakanen-terraform"
  resource_group_name          = var.rg
  location                     = var.location
  version                      = "12.0"
  administrator_login          = data.azurerm_key_vault_secret.dbuser.value
  administrator_login_password = data.azurerm_key_vault_secret.dbpass.value
  minimum_tls_version          = "1.2"
}
resource "azurerm_mssql_database" "sql_database" {
  name = "db-anssihakanen-terraform"
  
  server_id = azurerm_mssql_server.sql_server.id
  
  lifecycle {
    prevent_destroy = false
  }
}