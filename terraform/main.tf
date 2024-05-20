
# module "network" {
#   source   = "./modules/network"
#   for_each = var.network

#   network_name = each.value.network_name
#   subnets      = each.value.subnets

# }


module "bastion" {
  source = "./modules/vm"

  instance_name     = var.bastion.instance_name
  machine_type      = var.bastion.machine_type
  zone              = var.bastion.zone
  tags              = var.bastion.tags
  boot_disk         = var.bastion.boot_disk
  network_interface = var.bastion.network_interface
}