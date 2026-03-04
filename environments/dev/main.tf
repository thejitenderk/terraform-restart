module "rgs" {
  source         = "../../modules/resource_group"
  resource_group = var.parent_resource_group
}

module "vnets" {
  depends_on = [module.rgs]
  source     = "../../modules/virtual_network"
  virtual_network = var.parent_virtual_network
}


module "nics" {
  depends_on        = [module.rgs, module.vnets]
  source            = "../../modules/network_interface"
  network_interface = var.parent_network_interface
}

module "vms" {
  depends_on    = [module.rgs, module.nics]
  source        = "../../modules/linux_virtual_machine"
  linux_machine = var.parent_linux_machine
}
