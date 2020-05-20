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

resource "azurerm_sql_server" "default" {
  name                         = "${var.resource_name}-sql-server"
  resource_group_name          = data.azurerm_resource_group.current.name
  location                     = coalesce(var.location, data.azurerm_resource_group.current.location)
  version                      = var.server_version
  administrator_login          = var.admin_login
  administrator_login_password = "${var.resource_name}Raju!123"
}

resource "azurerm_sql_database" "default" {
  name                = "${var.resource_name}-sql-db"
  resource_group_name = data.azurerm_resource_group.current.name
  location            = coalesce(var.location, data.azurerm_resource_group.current.location)
  server_name         = azurerm_sql_server.default.name
}
