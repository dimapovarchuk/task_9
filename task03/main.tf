provider "azurerm" {
  features {}
}

# Зчитування існуючої групи ресурсів
data "azurerm_resource_group" "existing_rg" {
  name = var.resource_group_name
}

# Створення облікового запису зберігання
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.existing_rg.name
  location                 = data.azurerm_resource_group.existing_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = merge(var.tags, { "owner" = "user" })
}

# Створення віртуальної мережі
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  location            = data.azurerm_resource_group.existing_rg.location
  address_space       = var.address_space
  tags                = merge(var.tags, { "owner" = "user" })
}

# Створення підмереж
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = element(var.subnet_names, count.index)
  resource_group_name  = data.azurerm_resource_group.existing_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.subnet_prefixes, count.index)]
}
