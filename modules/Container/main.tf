resource "azurerm_container_group" "container_group" {
  name                = "cg-anssihakanen-terraform"
  location            = var.location
  resource_group_name = var.rg
  os_type             = "Linux"
  ip_address_type     = "Public"
  

  container {
    name   = "clamav"
    image  = "clamav/clamav:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 443
      protocol = "TCP"
    }
    ports {
     port = 80
     protocol = "TCP"
    }
  }
}