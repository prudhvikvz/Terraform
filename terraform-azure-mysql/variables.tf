variable resource_group_name {
  type        = string
  description = "The name of the Resource Group to access the resources"
}

variable admin_login {
  type        = string
  description = "Username for admin credentials"
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

variable config {
  type = map

  default = {
    sku_name              = "B_Gen5_2"
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
    version               = "5.7"
    ssl_enforcement       = "Enabled"
  }
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
