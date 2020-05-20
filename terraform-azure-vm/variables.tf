variable resource_group_name {
  type        = string
  description = "The name of the Resource Group to access the resources"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID to be used"
}

variable resource_name {
  type        = string
  description = "Resource name to be added as prefix to the name of the services"
}

variable vm_size {
  type    = string
  default = "Standard_E2s_v3"
}

variable caching {
  type    = string
  default = "ReadWrite"
}

variable storage_account_type {
  type    = string
  default = "Premium_LRS"
}

variable create_option {
  type    = string
  default = "FromImage"
}

variable image_publisher {
  type        = string
  description = "name of the Image publisher"
}

variable image_offer {
  type        = string
  description = "name of the Image offer"
}

variable sku {
  type        = string
  description = "sku for the vm"
}

variable image_version {
  type    = string
  default = "latest"
}

variable role_definition {
  type        = string
  description = "Roletype to be given to resource"
}

variable os_type {
  type        = string
  description = "VM type can be `windows` or `linux`"
}

variable pass {
  type  = string
  description = "Password"
}

variable nsg_name {
  type  = string
  description = "Name of the nsg to associate"
}

variable nic_name {
  type  = string
  description = "Name of the NIC to associate"
}

variable location {
  type  = string
  description = "Location in which storage account to be created, If empty - takes resource group location default"
}