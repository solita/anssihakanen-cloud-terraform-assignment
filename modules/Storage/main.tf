

resource "azurerm_storage_account" "storage_account" {
  name                     = "saanssihakanen123123"
  resource_group_name      = var.rg
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Owner = var.owner
    dueDate = var.dueDate
  }
}