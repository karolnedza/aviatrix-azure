###############################################################
#  Remote backend
terraform {
  backend "azurerm" {
    storage_account_name = "avxtransitstate"
    container_name       = "avxtransitstate"
    key                  = "spoke.terraform.tfstate"
  }
}



###############################################################
# Remote states


data "terraform_remote_state" "avxtransitstate" {
  backend = "azurerm"
  config = {
    storage_account_name = "avxtransitstate"
    container_name       = "avxtransitstate"
    key                  = "transit.terraform.tfstate"
  }
}


data "terraform_remote_state" "avxsecdomain" {
  backend = "azurerm"
  config = {
    storage_account_name = "avxtransitstate"
    container_name       = "avxtransitstate"
    key                  = "secdomain.terraform.tfstate"
  }
}
