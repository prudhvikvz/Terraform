variable resource_group_name {
  type        = string
  description = "The name of the Resource Group to access the resources"
}

variable subscription_id {
  type        = string
  description = "Subscription ID to be used"
}

variable storage_account_name {
  type        = string
  description = "Name of the storage account to create diag settings"
}

variable location {
  type        = string
  description = "Location in which storage account to be created, If empty - takes resource group location default"
}

variable resource_name {
  type        = string
  description = "Resource name to be added as prefix to the name of the services"
}

variable address_space {
  type        = string
  description = "Virtual Network Address Space"
}

variable address_prefix {
  type        = string
  description = "Address prefix for the subnet"
}

variable log_enabled {
  type        = bool
  description = "Either `true` to enable logs in diagnostic settings or `false` to disable it."
}

variable metrics_enabled {
  type        = bool
  description = "Either `true` to enable metrics in diagnostic settings or `false` to disable it."
}

variable retention_days {
  type        = number
  description = "The number of days to keep diagnostic logs."
}

variable role_definition {
  type        = string
  description = "Roletype to be given to resource"
}

variable log_categories {
  type        = list
  description = "List of log categories."
}

variable metric_categories {
  type        = list
  description = "List of metric categories."
}

variable service_endpoints {
  type        = list
  description = "Service Endpoints for the services to extend virtual network private address space"
}
