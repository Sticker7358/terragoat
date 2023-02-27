provider "random" {
}

resource "random_string" "sa_name_affix" {
  length  = 8
  special = false
  upper   = false
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "trekgroup" {
  name     = "trekgroup-resources"
  location = "West US"
  tags = {
    yor_trace = "5e6c8699-f708-40cf-91ba-e7a0ba6e3fba::GxRZZuEt0y12GqLa8jg3ELMV1XM"
  }
}

resource "azurerm_storage_account" "storagebay" {
  name                     = "storagebay${random_string.sa_name_affix.result}"
  resource_group_name      = azurerm_resource_group.trekgroup.name
  location                 = azurerm_resource_group.trekgroup.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    yor_trace = "5e6c8699-f708-40cf-91ba-e7a0ba6e3fba::GxRZZuEt0y12GqLa8jg3ELMV1XM"
  }
}
