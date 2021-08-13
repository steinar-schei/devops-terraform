provider "azurerm" {
    subscription_id = var.subscription_id
    features {} # terraform needs this to configure the provider 
}

module "my_first_module" {
    source = ".//resource-group"
    resource_group_name = "oppgave6-rg"
    location = "westeurope"
}

module "my_second_module" {
    source = ".//network"
    resource_group_name = "oppgave6-rg"
    vnet_name = "oppgave6-vnet"
    subnets = {
        "subnet1" = {
            name = "subnet1"
            address_space = ["10.0.0.0/24"]
        }
        "subnet2" = {
            name = "subnet2"
            address_space = ["10.1.0.0/24"]
        }
    }
    vnet_addres_space = [ "10.0.0.0/16" ]
}