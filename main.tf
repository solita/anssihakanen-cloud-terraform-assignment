resource "azurerm_resource_group" "rg-terraformresources-anssihakanen" {
  name     = "rg-terraformresources-anssihakanen"
  location = var.location
  tags = {
    Owner = var.owner
    dueDate = var.dueDate
  }
}


resource "azurerm_virtual_network" "vnet1" {
  name                = "vnet1"
  resource_group_name = var.rg
  location            = var.location
  address_space       = ["10.100.100.0/16"]

}

resource "azurerm_subnet" "sub1" {
  name                 = "sub1"
  resource_group_name  = var.rg
  virtual_network_name = azurerm_virtual_network.vnet1.name
  address_prefixes     = ["10.100.101.0/24"]
}

module "database" {
  source   = "./modules/Database"
  rg       = var.rg
  location = var.location
}

module "function_app" {
  source   = "./modules/FunctionApp"
  owner    = var.owner
  dueDate  = var.dueDate
  rg       = var.rg
  location = var.location
  sa       = module.storage.storage_account
}

module "eventgrid" {
  source   = "./modules/Eventgrid"
  owner    = var.owner
  dueDate  = var.dueDate
  rg       = var.rg
  location = var.location
  sa       = module.storage.storage_account
}

module "storage" {
  source   = "./modules/Storage"
  owner    = var.owner
  dueDate  = var.dueDate
  rg       = var.rg
  location = var.location
}

/* module "keyvault" {
  source   = "./modules/Keyvault"
  owner    = var.owner
  dueDate  = var.dueDate
  rg       = var.rg
  location = var.location
} */

module "container" {
  source   = "./modules/Container"
  owner    = var.owner
  dueDate  = var.dueDate
  rg       = var.rg
  location = var.location
}