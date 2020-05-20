module "virtual_machine" {
  source              = "../"
  resource_group_name = var.resource_group_name
  subscription_id     = var.subscription_id
  resource_name       = var.resource_name
  image_publisher     = var.image_publisher
  image_offer         = var.image_offer
  sku                 = var.sku
  role_definition     = var.role_definition
  os_type             = var.os_type
  pass                = var.pass
  nsg_name            = var.nsg_name
  nic_name            = var.nic_name
  location            = var.location
}
`