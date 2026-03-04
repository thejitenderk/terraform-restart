output "rgnames" {
  value = { for k, v in azurerm_resource_group.resource_group: k => v.name }
}

output "rglocs" {
  value = { for k, v in azurerm_resource_group.resource_group: k => v.location }
}