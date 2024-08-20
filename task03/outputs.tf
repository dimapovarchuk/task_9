output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_names" {
  value = [for s in azurerm_subnet.subnets : s.name]
}
