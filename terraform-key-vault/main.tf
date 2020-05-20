provider "azurerm" {
   version = ">2.0.0"
  subscription_id = var.subscription_id
  features {
    key_vault {
      purge_soft_delete_on_destroy = true
    }
  }
}


data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "current" {
  name     = var.resource_group_name  
}

data "azurerm_storage_account" "current" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.current.name
}

resource "azurerm_key_vault" "default" {
  name                        = var.key_vault_name
  location                    = coalesce(var.location,data.azurerm_resource_group.current.location)
  resource_group_name         = data.azurerm_resource_group.current.name
  enabled_for_disk_encryption = var.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_enabled         = var.soft_delete_enabled
  purge_protection_enabled    = var.purge_protection_enabled

  sku_name = var.sku

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "get",
    ]

    secret_permissions = [
      "get",
    ]

    storage_permissions = [
      "get",
    ]
  }

  network_acls {
    default_action = var.default_action
    bypass         = var.bypass
  }
}
