variable resource_group_name {
  type        = string
  description = "The name of the Resource Group to access the resources"
}

variable key_vault_name {
  type        = string
  description = "Name of the keyvault to create"
}

variable subscription_id {
  type        = string
  description = "Subscription ID to be used"
}

variable location {
  type        = string
  description = "Location in which keyvault to be created, If empty - takes resource group location default"
}

variable enabled_for_disk_encryption {
  type        = bool
  description = "Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys"
}

variable soft_delete_enabled {
  type        = bool
  description = " Should Soft Delete be enabled for this Key Vault?"
}

variable purge_protection_enabled {
  type        = bool
  description = "Is Purge Protection enabled for this Key Vault?"
}

variable sku {
  type        = string
  description = "The Name of the SKU used for this Key Vault. Possible values are standard and premium"
}

variable default_action {
  type        = string
  description = "The Default Action to use when no rules match from ip_rules / virtual_network_subnet_ids. Possible values are Allow and Deny."
}

variable storage_account_name {
  type        = string
  description = "Name of the storage account to create diag settings"
}

variable resource_name {
  type        = string
  description = "Resource name to be added as prefix to the name of the services"
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
