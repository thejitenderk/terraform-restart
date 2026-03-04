resource "azurerm_linux_virtual_machine" "linux_machine" {
  for_each                        = var.linux_machine
  name                            = each.key
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.vm_size
  admin_username                  = each.value.vm_user
  admin_password                  = each.value.vm_pass
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.datanic[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
