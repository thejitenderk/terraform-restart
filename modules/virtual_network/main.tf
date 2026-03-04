resource "azurerm_virtual_network" "vnet-dynamic" {
  for_each            = var.virtual_network
  name                = each.value.vnetname
  location            = each.value.rgloc
  resource_group_name = each.value.rgname
  address_space       = each.value.address_space

  dynamic "subnet" {
    for_each = each.value.subnet
    iterator = snet
    content {
      name             = snet.value.name
      address_prefixes = snet.value.address_prefixes
    }
  }

  tags = each.value.tags
}
