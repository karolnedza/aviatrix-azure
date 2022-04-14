### Transit Network "West Europe"

module "az-audio-west-europe" {
  source  = "./avx-azure-transit-firenet"
  region                 = "West Europe"
  account                = "az-transit-account"
  cidr                   = "10.10.0.0/23"
  gw_name                = "az-tgw-west-eu"
  firewall_name          = "az-fw-weu"
  vnet_name               = "az-vnet-west-eu"
  local_as_number          = "4225000000"
  firewall_image         = "Check Point CloudGuard IaaS Standalone (gateway + management) R80.40 - Bring Your Own License"
  firewall_image_version = "8030.900273.0819"
}
