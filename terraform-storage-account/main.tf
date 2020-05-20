provider "azurerm" {
  version = ">2.0.0"
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "current" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "default" {
  name                     = "${var.resource_name}sa"
  resource_group_name      = data.azurerm_resource_group.current.name
  location                 = coalesce(var.location,data.azurerm_resource_group.current.location)
  account_tier             = var.account_type
  account_replication_type = var.account_replication_type
}
