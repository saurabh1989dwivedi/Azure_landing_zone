
resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_network_security_rule" "allow_ssh" {
  for_each = var.nsg_rule

  name      = each.value.name
  priority  = each.value.priority
  direction = each.value.direction
  access    = each.value.access
  protocol  = each.value.protocol

  source_port_range      = each.value.source_port_range
  destination_port_range = each.value.destination_port_range

  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  resource_group_name         = each.value.resource_group_name
  network_security_group_name = each.value.network_security_group_name
}

resource "azurerm_network_security_rule" "allow_http" {
  for_each  = var.nsg_rule
  name      = each.value.name
  priority  = each.value.priority
  direction = each.value.direction
  access    = each.value.access
  protocol  = each.value.protocol

  source_port_range      = each.value.source_port_range
  destination_port_range = each.value.destination_port_range

  source_address_prefix      = each.value.source_address_prefix
  destination_address_prefix = each.value.destination_address_prefix

  resource_group_name         = each.value.resource_group_name
  network_security_group_name = each.value.network_security_group_name
}



