provider "azurerm" {
    subscription_id = var.subscription_id
    features {} # terraform needs this to configure the provider 
}

resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
    tags = {
        owner = "steinar.schei@soprasteria.com"
    }
}