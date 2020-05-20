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

locals {
  https_only = true
  service    = true
  container  = true
  object     = true
  blob       = true
  queue      = false
  table      = false
  file       = false
}

data "azurerm_storage_account_sas" "current" {
  connection_string = data.azurerm_storage_account.current.primary_connection_string
  https_only        = local.https_only

  resource_types {
    service   = local.service
    container = local.container
    object    = local.object
  }

  services {
    blob  = local.blob
    queue = local.queue
    table = local.table
    file  = local.file
  }   

  start  = timestamp()
  expiry = timeadd(timestamp(), "${var.days * 24}h")

  permissions {
    read    = var.read
    write   = var.write
    delete  = var.delete
    list    = var.list
    add     = var.add
    create  = var.create
    update  = var.update
    process = var.process
  }
}
