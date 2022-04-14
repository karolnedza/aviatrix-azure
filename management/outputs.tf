# ##### Outputs
#
output "aviatrix_controller_public_ip" {
  value =  azurerm_public_ip.avx-controller-public-ip.ip_address
}

output "aviatrix_controller_private_ip" {
  value = azurerm_network_interface.avx-ctrl-iface.private_ip_address
}

# output "aviatrix_copilot_public_ip" {
#   value =  azurerm_public_ip.avx-copilot-public-ip.ip_address
# }
