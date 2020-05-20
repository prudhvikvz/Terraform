provider "azurerm" {
  version = ">2.0.0"
  features {}
  subscription_id = var.subscription_id
}

data "azurerm_resource_group" "current" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "current" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.current.name
}

data "azurerm_subnet" "current" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = data.azurerm_resource_group.current.name
}

resource "azurerm_network_security_group" "default" {
  name                = "${var.resource_name}-nsg"
  location            = coalesce(var.location, data.azurerm_resource_group.current.location)
  resource_group_name = data.azurerm_resource_group.current.name
}

resource "azurerm_public_ip" "default" {
  name                = "${var.resource_name}-pubip"
  location            = coalesce(var.location, data.azurerm_resource_group.current.location)
  resource_group_name = data.azurerm_resource_group.current.name
  allocation_method   = var.allocation_method
}

resource "azurerm_network_interface" "default" {
  name                = "${var.resource_name}-nic"
  location            = coalesce(var.location, data.azurerm_resource_group.current.location)
  resource_group_name = data.azurerm_resource_group.current.name

  ip_configuration {
    name                          = "${var.resource_name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.current.id
    private_ip_address_allocation = var.address_allocation_ip
    public_ip_address_id          = azurerm_public_ip.default.id
  }
}

resource "azurerm_network_interface_security_group_association" "default" {
  network_interface_id      = azurerm_network_interface.default.id
  network_security_group_id = azurerm_network_security_group.default.id
}

resource "azurerm_network_security_rule" "predefined_rules" {
  count                       = length(var.predefined_rules)
  name                        = lookup(var.predefined_rules[count.index], "name")
  priority                    = lookup(var.predefined_rules[count.index], "priority", 4096 - length(var.predefined_rules) + count.index)
  direction                   = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 0)
  access                      = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 1)
  protocol                    = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 2)
  source_port_ranges          = split(",", replace(lookup(var.predefined_rules[count.index], "source_port_range", "*"), "*", "0-65535"))
  destination_port_range      = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 4)
  description                 = element(var.rules[lookup(var.predefined_rules[count.index], "name")], 5)
  source_address_prefix       = join(",", var.source_address_prefix)
  destination_address_prefix  = join(",", var.destination_address_prefix)
  resource_group_name         = data.azurerm_resource_group.current.name
  network_security_group_name = azurerm_network_security_group.default.name
}

resource "azurerm_network_security_rule" "custom_rules" {
  count                       = length(var.custom_rules)
  name                        = lookup(var.custom_rules[count.index], "name", "default_rule_name")
  priority                    = lookup(var.custom_rules[count.index], "priority")
  direction                   = lookup(var.custom_rules[count.index], "direction", "Any")
  access                      = lookup(var.custom_rules[count.index], "access", "Allow")
  protocol                    = lookup(var.custom_rules[count.index], "protocol", "*")
  source_port_ranges          = split(",", replace(lookup(var.custom_rules[count.index], "source_port_range", "*"), "*", "0-65535"))
  destination_port_ranges     = split(",", replace(lookup(var.custom_rules[count.index], "destination_port_range", "*"), "*", "0-65535"))
  source_address_prefix       = lookup(var.custom_rules[count.index], "source_address_prefix", "*")
  destination_address_prefix  = lookup(var.custom_rules[count.index], "destination_address_prefix", "*")
  description                 = lookup(var.custom_rules[count.index], "description", "Security rule for ${lookup(var.custom_rules[count.index], "name", "default_rule_name")}")
  resource_group_name         = data.azurerm_resource_group.current.name
  network_security_group_name = azurerm_network_security_group.default.name
}