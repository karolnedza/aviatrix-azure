terraform {
  backend "azurerm" {
    storage_account_name = "avxtransitstate"
    container_name       = "avxtransitstate"
    key                  = "onprem.terraform.tfstate"
  }
}
