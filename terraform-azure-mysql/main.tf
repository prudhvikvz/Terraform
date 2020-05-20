provider "azurerm" {
  version = ">2.0.0"
  features {}
}

data "azurerm_resource_group" "current" {
  name = var.resource_group_name
}

resource "random_password" "default" {
  length = 16
  special = true
}

data "azurerm_storage_account" "current" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.current.name
}

resource "azurerm_mysql_server" "default" {
  name                = "${var.resource_name}-sqlserver"
  location            = coalesce(var.location,data.azurerm_resource_group.current.location)
  resource_group_name = data.azurerm_resource_group.current.name

  sku_name = var.config["sku_name"]

  storage_profile {
    storage_mb            = var.config["storage_mb"]
    backup_retention_days = var.config["backup_retention_days"]
    geo_redundant_backup  = var.config["geo_redundant_backup"]
  }

  administrator_login          = var.admin_login
  administrator_login_password = random_password.default.result
  version                      = var.config["version"]
  ssl_enforcement              = var.config["ssl_enforcement"]
}