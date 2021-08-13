provider "azurerm" {
  subscription_id = var.subscription_id
  features {} # terraform needs this to configure the provider 
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    deployment = "terraform"
  }
}

resource "azurerm_subnet" "subnets" {
  for_each             = var.subnets
  name                 = each.value.name
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = var.vnet_name
  address_prefixes     = each.value.address_space
}