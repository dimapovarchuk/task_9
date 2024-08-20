provider "azurerm" {
  features {}
}

# Створення групи ресурсів (якщо вона не існує)
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

# Створення облікового запису сховища
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

# Створення віртуальної мережі
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = var.address_space
  tags                = var.tags
}

# Створення підмереж
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = element(var.subnet_names, count.index)
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.subnet_prefixes, count.index)]
}

# Додавання нових тегів до існуючої інфраструктури
resource "azurerm_resource_group" "update_rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = merge(var.tags, { "owner" = "user" })
}
