variable resource_group_name {
  type        = string
  description = "The name of the Resource Group to access the resources"
}

variable subscription_id {
  type        = string
  description = "Subscription ID to be used"
}

variable resource_name {
  type        = string
  description = "Resource name to be added as prefix to the name of the services"
}

variable subnet_name {
  type        = string
  description = "Name of the subnet to associate NSG"
}

variable virtual_network_name {
  type        = string
  description = "Name of the VirtualNetwork in which Subnet is associated"
}

variable location {
  type        = string
  description = "Location in which storage account to be created, If empty - takes resource group location default"
}

variable account_type {
  type        = string
  description = "Performance of the storage account  Standard or Premium"
}

variable account_replication_type {
  type        = string
  description = "Storage account replication type to be created"
}

variable role_definition {
  type        = string
  description = "Roletype to be given to resource"
}

variable default_action {
  type        = string
  description = "Default action for the network Allow or Deny"
}

variable ip_rules {
  type        = list
  description = "List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed."
}
