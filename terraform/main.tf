module "network" {
  source = "./modules/network"
  for_each = var.network
  
  network_name = each.value.network_name
  subnets      = each.value.subnets
  
}