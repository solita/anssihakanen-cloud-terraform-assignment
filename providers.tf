terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.37.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "1.2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
  /*In backend azurerm block insert your storage account information where to store
    Terraform state. Key means filename inside storage account container. If file
    doesn't exists terraform will create it.*/
  backend "azurerm" {
    resource_group_name  = "rg-academy2024-anssihakanen"
    storage_account_name = "saacademyanssihakanen001"
    container_name       = "blobacademyanssihakanen001"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}
provider "azapi" {

}
provider "random" {

}