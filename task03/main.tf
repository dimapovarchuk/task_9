provider "azurerm" {
  features {}
}

# Отримуємо дані про вже існуючу групу ресурсів
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Створення облікового запису сховища
resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.rg.name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

# Створення віртуальної мережі
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  address_space       = var.address_space
  tags                = var.tags
}

# Створення двох підмереж (private і public)
resource "azurerm_subnet" "subnets" {
  count                = length(var.subnet_names)
  name                 = element(var.subnet_names, count.index)
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.subnet_prefixes, count.index)]
}
