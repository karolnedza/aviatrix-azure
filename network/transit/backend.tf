terraform {
  backend "azurerm" {
    storage_account_name = "avxtransitstate"
    container_name       = "avxtransitstate"
    key                  = "transit.terraform.tfstate"
  }
}
