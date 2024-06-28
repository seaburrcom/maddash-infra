output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vpc_name" {
    value = azurerm_virtual_network.seaburrcom_vnet.name
}