variable resource_name {
  type        = string
  description = "Resource Name"
}

variable resource_id {
  type        = string
  description = "The ID of the resource."
}

variable log_categories {
  type        = list
  description = "List of log categories."
}

variable metric_categories {
  type        = list
  description = "List of metric categories."
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

variable storage_account_id {
  type        = string
  description = "The ID of the storage account to send diagnostic logs to."
}