variable resource_group_name {
  type        = string
  description = "The name of the Resource Group to access the resources"
}

variable location {
  type        = string
  description = "Location in which mysql to be created, If empty - takes resource group location default"
}

variable "subscription_id" {
  type        = string
  description = "Subscription ID to be used"
}

variable resource_name {
  type        = string
  description = "Resource name to be added as prefix to the name of the services"
}

variable storage_account_name {
  type        = string
  description = "Name of the storage account to create diag settings"
}

variable dotnet_framework_version {
  type = string
  description = "The version of the .net framework's CLR used in this App Service."
  default = "v4.0"
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
