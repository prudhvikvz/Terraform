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

variable allocation_method {
  type        = string
  description = "Allocation method for public_ip Static or Dynamic"
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

variable custom_rules {
  description = "Custom set of security rules using this format"
  type        = list(any)
  default     = []

  # Example:
  # custom_rules = [{
  # name                   = "myssh"
  # priority               = "101"
  # direction              = "Inbound"
  # access                 = "Allow"
  # protocol               = "tcp"
  # source_port_range      = "1234"
  # destination_port_range = "22"
  # description            = "description-myssh"
  #}]
}

variable rule_protocol {
  type = string
  description = "Pre-defined rule"
}

# Security rules configuration 
variable source_address_prefix {
  type    = list(any)
  default = ["*"]

  # Example: ["10.0.3.0/24"]
}

variable destination_address_prefix {
  type    = list(any)
  default = ["*"]
 
  # Example: ["10.0.3.0/32","10.0.3.128/32"]
}