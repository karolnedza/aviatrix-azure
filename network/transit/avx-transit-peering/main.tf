locals {

  #Create all peerings based on list of all gateways
  peerings = flatten([
    for gw in var.transit_gateways : [
      #The slice below creates a new list with the remaining gateways excluding itself. E.g. based on input var.transit_gateways = ["gw1","gw2","gw3","gw4","gw5","gw6","gw7","gw8","gw9","gw10"] and we arrive at gw = "gw6" in the for loop for example, the sliced list will result in: ["gw7","gw8","gw9","gw10"]
      for peer_gw in slice(var.transit_gateways, index(var.transit_gateways, gw) + 1, length(var.transit_gateways)) : {
        gw1 = gw
        gw2 = peer_gw
      }
    ]
  ])

  #Create map for consumption in for_each.
  peerings_map = {
    for peering in local.peerings : "${peering.gw1}:${peering.gw2}" => peering
  }

}

resource "aviatrix_transit_gateway_peering" "peering" {
  for_each                            = local.peerings_map
  transit_gateway_name1               = each.value.gw1
  transit_gateway_name2               = each.value.gw2
  enable_peering_over_private_network = var.enable_peering_over_private_network

  lifecycle {
    ignore_changes = [
      gateway1_excluded_network_cidrs,
      gateway2_excluded_network_cidrs,
      gateway1_excluded_tgw_connections,
      gateway2_excluded_tgw_connections,
      prepend_as_path1,
      prepend_as_path2,
    ]
  }
}
