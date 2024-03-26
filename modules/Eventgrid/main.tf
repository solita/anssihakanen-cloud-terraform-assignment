resource "azurerm_storage_queue" "storage_queue" {
    name = "sq-anssihakanen-terraform"
    storage_account_name = var.sa.name
}


resource "azurerm_eventgrid_system_topic" "eventgrid_topic" {
  name                = "eventgrid-topic"
  location            = var.location
  resource_group_name = var.rg
  source_arm_resource_id = var.sa.id
  topic_type = "Microsoft.Storage.StorageAccounts"
  tags = {
    owner = var.owner
    dueDate = var. dueDate
  }
}

resource "azurerm_eventgrid_system_topic_event_subscription" "event_subscription" {
  name = "es-anssihakanen-terraform"
    system_topic = azurerm_eventgrid_system_topic.eventgrid_topic.name
    resource_group_name = var.rg
    storage_queue_endpoint {
        storage_account_id = var.sa.id
        queue_name = azurerm_storage_queue.storage_queue.name
    }
}