provider "azurerm" {
  version = ">2.0.0"
  features {}
  subscription_id = var.subscription_id
}

locals {
  offer_type  = {
    offer_type  = "standard"
    max_interval_in_seconds = 300
    max_staleness_prefix  = 100001
  }
}


data "azurerm_resource_group" "current" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "current" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.current.name
}

resource "azurerm_cosmosdb_account" "default" {
  name                = "cosmos-dab-${var.resource_name}"
  location            = coalesce(var.location,data.azurerm_resource_group.current.location)
  resource_group_name = data.azurerm_resource_group.current.name
  offer_type          = local.offer_type.offer_type
  kind                = var.kind

  enable_automatic_failover = true

  consistency_policy {
    consistency_level       = var.consistency_level
    max_interval_in_seconds = local.offer_type.max_interval_in_seconds
    max_staleness_prefix    = local.offer_type.max_staleness_prefix
  }

  geo_location {
    location          = var.failover_location
    failover_priority = 1
  }

  geo_location {
    location          = data.azurerm_resource_group.current.location
    failover_priority = 0
  }
}