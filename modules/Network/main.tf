resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  resource_group_name = var.rg
  location            = var.location
  address_space       = ["10.100.0.0/16"]

}

resource "azurerm_subnet" "sub1" {
  name                 = "sub1"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.100.1.0/24"]
}

resource "azurerm_subnet" "sub2" {
  name                 = "sub2"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.100.2.0/24"]
}

resource "azurerm_subnet" "sub3" {
  name                 = "sub3"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.100.3.0/24"]
}