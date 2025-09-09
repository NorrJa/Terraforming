terraform{
    required_providers{
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.0"
        }
    }
}

provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "TestRG" {
    name     = "TestRG"
    location = "Canada Central"
}

resource "azurerm_network_interface" "TestNIC" {
    name                = "TestNIC"
    location            = azurerm_resource_group.TestRG.location
    resource_group_name = azurerm_resource_group.TestRG.name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.TestSubnet.id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_network_interface" "TestNIC2" {
    name                = "TestNIC2"
    location            = azurerm_resource_group.TestRG.location
    resource_group_name = azurerm_resource_group.TestRG.name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = azurerm_subnet.TestSubnet.id
        private_ip_address_allocation = "Dynamic"
    }
}