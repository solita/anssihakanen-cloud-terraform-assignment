/*These are the providers that are needed in the assignment. You can upgrade these to newer ones. Azapi
is optional and it's needed if one wants to create container using container apps in time of writing this assignment.*/
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
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
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

