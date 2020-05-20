provider "azurerm" {
  version = ">2.0.0"
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "current" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "current" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.current.name
}

resource "azurerm_virtual_network" "default" {
  name                = "${var.resource_name}-vnet"
  address_space       = [var.address_space]
  resource_group_name = data.azurerm_resource_group.current.name
  location            = coalesce(var.location,data.azurerm_resource_group.current.location)
}

resource "azurerm_subnet" "default" {
  name                 = "${var.resource_name}-subnet"
  resource_group_name  = data.azurerm_resource_group.current.name
  virtual_network_name = azurerm_virtual_network.default.name
  address_prefix       = var.address_prefix
  service_endpoints    = var.service_endpoints
}
