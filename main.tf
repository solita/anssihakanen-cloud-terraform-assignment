data "azurerm_client_config" "current" {}

resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  resource_group_name = var.rg
  location            = var.location
  address_space       = ["10.0.0.0/16"]

}

resource "azurerm_subnet" "sub1" {
  name                 = "sub1"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.0.2.0/24"]
}


resource "azurerm_key_vault" "keyvault" {
  name                        = "kvacademyanssihakanen001"
  location                    = var.location
  resource_group_name         = var.rg
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}


output "vault_uri" {
  value = azurerm_key_vault.keyvault.vault_uri
}

output "vault_id" {
  value = azurerm_key_vault.keyvault.id
}