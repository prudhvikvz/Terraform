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

variable location {
  type        = string
  description = "Location in which cosmosDB to be created, If empty - takes resource group location default"
}

variable storage_account_name {
  type        = string
  description = "Name of the storage account to create diag settings"
}

variable kind {
  type        = string
  description = "Kind of DB MongoDB or GlobalDocumentDB"
  default     = "GlobalDocumentDB"
}

variable failover_location {
  type        = string
  description = "Azure location to host replicated data"
}

variable consistency_level {
  type        = string
  description = "consistency level for the db"
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
