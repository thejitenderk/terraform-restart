# this is resource group for compute/security/networking
parent_resource_group = {
  rg1 = {
    name     = "rg-demo-01"
    location = "SoutheastAsia"
  }
}


parent_virtual_network  = {
  vnet1 = {
    vnetname      = "vnet-dynamic"
    address_space = ["10.0.0.0/16"]
    rgname        = "rg-demo-01"
    rgloc         = "SoutheastAsia"
    tags = {
      env = "prod"
    }
    subnet = {
      subnet1 = {
        name             = "subnet-front"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "subnet-back"
        address_prefixes = ["10.0.2.0/24"]
      }
      subnet3 = {
        name             = "subnet-appgw"
        address_prefixes = ["10.0.3.0/24"]
      }
    }
  }
  vnet2 = {
    vnetname      = "vnet-dynamic-2"
    address_space = ["10.1.0.0/16"]
    rgname        = "rg-demo-01"
    rgloc         = "SoutheastAsia"
    tags = {
      env = "prod"
    }
    subnet = {
      subnet1 = {
        name             = "subnet-front"
        address_prefixes = ["10.1.1.0/24"]
      }
      subnet2 = {
        name             = "subnet-back"
        address_prefixes = ["10.1.2.0/24"]
      }
      subnet3 = {
        name             = "subnet-appgw"
        address_prefixes = ["10.1.3.0/24"]
      }
    }
  }
}


parent_network_interface = {
  front-nic-01 = {
    location                      = "SoutheastAsia"
    resource_group_name           = "rg-demo-01"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "subnet-front"
    vnetname                      = "vnet-dynamic"
  }
  back-nic-01 = {
    location                      = "SoutheastAsia"
    resource_group_name           = "rg-demo-01"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   =  "subnet-back"
    vnetname                      = "vnet-dynamic"
  }
}

parent_linux_machine = {
  front-vm-01 = {
    resource_group_name = "rg-demo-01"
    location            = "SoutheastAsia"
    vm_size             = "Standard_D2s_v3"
    vm_user             = "azureadmin"
    vm_pass             = "Welcome$1234"
    nicname             = "front-nic-01"
  }
  back-vm-01 = {
    resource_group_name = "rg-demo-01"
    location            = "SoutheastAsia"
    vm_size             = "Standard_D2s_v3"
    vm_user             = "azureadmin"
    vm_pass             = "Welcome$1234"
    nicname             = "back-nic-01"
  }
}
