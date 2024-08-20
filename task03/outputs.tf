output "resource_group_name" {
  description = "Назва групи ресурсів"
  value       = data.azurerm_resource_group.rg.name
}

output "storage_account_name" {
  description = "Назва облікового запису сховища"
  value       = azurerm_storage_account.sa.name
}

output "vnet_name" {
  description = "Назва віртуальної мережі"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_names" {
  description = "Назви підмереж"
  value       = azurerm_subnet.subnets[*].name
}
