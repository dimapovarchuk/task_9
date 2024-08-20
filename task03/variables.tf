variable "resource_group_name" {
  description = "The name of the existing resource group"
  type        = string
  default     = "cmtr82c341d6-rg"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default     = "cmtr82c341d6sa"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "cmtr82c341d6-vnet"
}

variable "address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_names" {
  description = "The names of the subnets"
  type        = list(string)
  default     = ["private", "public"]
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    "environment" = "development"
    "owner"       = "user"
  }
}
