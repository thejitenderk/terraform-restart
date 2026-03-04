variable "parent_resource_group" {
    type = map(object({
      name = string
      location = optional(string, "westus") 
    }))
}

variable "parent_virtual_network" {
  type = map(object({
    vnetname = string
    rgname = string
    rgloc = string
    address_space = list(string) 
    tags = map(string)
    subnet = map(object({
      name = string
      address_prefixes = list(string) 
    }))
  }))
  description = "this is vnet is made with dynamic block"
}


variable "parent_network_interface" {
  
}

variable "parent_linux_machine" { 
}