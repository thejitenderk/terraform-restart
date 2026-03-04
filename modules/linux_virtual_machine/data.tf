data "azurerm_network_interface" "datanic" {
    for_each = var.linux_machine
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}