module "network" {
  source = "./modules/Network"
  rg = var.rg
  location = var.location
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

module "container" {
  source   = "./modules/Container"
  owner    = var.owner
  dueDate  = var.dueDate
  rg       = var.rg
  location = var.location
}

module "monitoring" {
  source   = "./modules/Monitoring"
  location = var.location
  rg       = var.rg
}