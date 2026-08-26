resource "azurerm_public_ip" "pip" {
name=var.name
location = var.location
resource_group_name = var.resource_group_name
sku=var.sku
allocation_method = var.allocation_method
}