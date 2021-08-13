variable "resource_group_name" {
    description = "Name for the resource group"
    type = string 
    default = "oppgave6-rg"
}

variable "location" {
    description = "Location for the resources"
    type = string
    default = "westeurope"
}

variable "subscription_id" {
  type = string
  default = "f838b27b-f323-4112-a510-8f6fc390b5e5"
}

variable "vnet_name" {
  type = string
  default = "oppgave6-vnet"
}

variable "subnets" {
    description = "Name of the subnet"
    type = map(object({
        name = string
        address_space = list(string)
    }))
}