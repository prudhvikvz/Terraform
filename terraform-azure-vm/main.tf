provider "azurerm" {
  version = ">2.0.0"
  features {}
  subscription_id = var.subscription_id
}

locals {
  vm_agent = {
    provision_vm_agent = false
  }

  disable_password_authentication = {
    disable_password_authentication = false
  }
}

data "azurerm_network_security_group" "current" {
  name                = var.nsg_name
  resource_group_name = data.azurerm_resource_group.current.name
}

data "azurerm_resource_group" "current" {
  name = var.resource_group_name
}

data "azurerm_network_interface" "current" {
  name                = var.nic_name
  resource_group_name = data.azurerm_resource_group.current.name
}

resource "random_password" "default" {
  length  = 8
  special = true
}

resource "azurerm_virtual_machine" "default" {
  name                  = "${var.resource_name}-${var.os_type}-vm"
  resource_group_name   = data.azurerm_resource_group.current.name
  location              = coalesce(var.location,data.azurerm_resource_group.current.location)
  vm_size               = var.vm_size
  network_interface_ids = [data.azurerm_network_interface.current.id]

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.sku
    version   = var.image_version
  }

  storage_os_disk {
    name              = "${var.resource_name}osDisk"
    caching           = var.caching
    create_option     = var.create_option
    managed_disk_type = var.storage_account_type
  }

  os_profile {
    computer_name  = "${var.resource_name}host"
    admin_username = "${var.resource_name}vmadmin"
    admin_password = var.pass
  }

  dynamic "os_profile_windows_config" {
    for_each = var.os_type == "windows" ? local.vm_agent : {}

    content {
      provision_vm_agent = local.vm_agent.provision_vm_agent
    }
  }

  dynamic "os_profile_linux_config" {
    for_each = var.os_type != "windows" ? local.disable_password_authentication : {}

    content {
      disable_password_authentication = local.disable_password_authentication.disable_password_authentication
    }
  }



}
