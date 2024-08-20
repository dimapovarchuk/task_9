output "resource_group_name" {
  value = data.azurerm_resource_group.existing_rg.name
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_names" {
  value = azurerm_subnet.subnets[*].name
}
