provider "azurerm" {
  version = ">2.0.0"
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "current" {
  name     = var.resource_group_name
}

data "azurerm_storage_account" "current" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.current.name
}

resource "azurerm_app_service_plan" "default" {
  name                = "${var.resource_name}-asp"
  location            = coalesce(var.location,data.azurerm_resource_group.current.location)
  resource_group_name = data.azurerm_resource_group.current.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "default" {
  name                = "${var.resource_name}-as"
  location            = coalesce(var.location,data.azurerm_resource_group.current.location)
  resource_group_name =  data.azurerm_resource_group.current.name
  app_service_plan_id = azurerm_app_service_plan.default.id

  site_config {
    dotnet_framework_version = var.dotnet_framework_version
  }
}