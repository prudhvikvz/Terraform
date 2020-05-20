variable resource_group_name {
  type        = string
  description = "The name of the Resource Group to access the resources"
}

variable location {
  type  = string
  description = "Location in which storage account to be created, If empty - takes resource group location default"
}

variable subscription_id {
  type        = string
  description = "Subscription ID to be used"
}

variable resource_name {
  type        = string
  description = "Resource name to be added as prefix to the name of the services"
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
