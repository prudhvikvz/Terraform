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

variable storage_account_name {
  type        = string
  description = "Name of the storage account to create diag settings"
}

variable read {
  type        = string
  description = "Should Read permissions be enabled for this SAS?"
}

variable write {
  type        = string
  description = "Should Write permissions be enabled for this SAS?"
}

variable delete {
  type        = string
  description = "Should Delete permissions be enabled for this SAS?"
}

variable list {
  type        = string
  description = "Should List permissions be enabled for this SAS?"
}

variable add {
  type        = string
  description = "Should Add permissions be enabled for this SAS?"
}

variable create {
  type        = string
  description = "Should Create permissions be enabled for this SAS"
}

variable update {
  type        = string
  description = "Should Update permissions be enabled for this SAS?"
}

variable process {
  type        = string
  description = "Should Process permissions be enabled for this SAS?"
}

variable days {
  type        = number
  description = "Number of days to be accesible this sas token"
}

