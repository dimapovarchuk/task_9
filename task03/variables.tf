variable "resource_group_name" {
  description = "Назва вже існуючої групи ресурсів"
  type        = string
  default     = "cmtr82c341d6-rg"
}

variable "location" {
  description = "Локація ресурсів"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Назва облікового запису сховища"
  type        = string
  default     = "cmtr82c341d6sa"
}

variable "vnet_name" {
  description = "Назва віртуальної мережі"
  type        = string
  default     = "cmtr82c341d6-vnet"
}

variable "address_space" {
  description = "Адресний простір віртуальної мережі"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_names" {
  description = "Назви підмереж"
  type        = list(string)
  default     = ["private", "public"]
}

variable "subnet_prefixes" {
  description = "Адресні префікси підмереж"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "tags" {
  description = "Теги для ресурсів"
  type        = map(string)
  default     = {
    environment = "production"
  }
}
