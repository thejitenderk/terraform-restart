data "azurerm_subnet" "datasubnet" {
  for_each             = var.network_interface
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}
