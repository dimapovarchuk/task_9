variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "cmtr82c341d6-rg"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
  default     = "cmtr82c341d6sa"
}

variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "cmtr82c341d6-vnet"
}

variable "subnet_names" {
  description = "List of Subnet names"
  type        = list(string)
  default     = ["private", "public"]
}

variable "address_space" {
  description = "The address space that is used by the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_prefixes" {
  description = "List of address prefixes for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {
    environment = "production"
    project     = "terraform-deployment"
  }
}
