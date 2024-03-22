resource "azurerm_eventgrid_topic" "eventgrid-topic" {
  name                = "eventgrid-topic"
  location            = var.location
  resource_group_name = var.rg
  tags = {
    owner = var.owner
    dueDate = var. dueDate
  }
}

resource "azurerm_eventgrid_event_subscription" "event_subscription" {
  name   = "event_subscription"
  scope  = "${modules/Storage.storage_account.name}"
  labels = ["azure-functions-event-grid-terraform"]
  azure_function_endpoint {
    function_id = "${modules/FunctionApp.function_app.name}" 

    # defaults, specified to avoid "no-op" changes when 'apply' is re-ran
    max_events_per_batch              = 1
    preferred_batch_size_in_kilobytes = 64
  }
}