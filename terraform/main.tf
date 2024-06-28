resource "azurerm_resource_group" "rg" {
  location = var.dc_location
  name     = var.resource_group_desired_name
}

resource "azurerm_virtual_network" "seaburrcom_vnet" {
  name                = "seaburrcom_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.dc_location
  resource_group_name = var.resource_group_desired_name
}

resource "azurerm_subnet" "vnet_subnet_1" {
  name                 = "subnet-1"
  resource_group_name  = var.resource_group_desired_name
  virtual_network_name = "seaburrcom_vnet"
  address_prefixes     = ["10.0.0.0/24"]
}