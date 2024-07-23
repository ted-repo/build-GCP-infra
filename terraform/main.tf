
module "network" {
  source   = "./modules/network"
  for_each = var.network

  network_name = each.value.network_name
  subnets      = each.value.subnets

}

module "bastion" {
  source = "./modules/vm"

  instance_name     = var.bastion.instance_name
  machine_type      = var.bastion.machine_type
  zone              = var.bastion.zone
  tags              = var.bastion.tags
  boot_disk         = var.bastion.boot_disk
  network_interface = var.bastion.network_interface
}

module "mig" {
  source = "./modules/instance-group"

  firewall_name = var.mig.firewall_name
  region        = var.mig.region
  machine_type  = var.mig.machine_type
  name          = var.mig.name
  zone          = var.mig.zone
}

module "load-balancer-global" {
  source = "./modules/load-balancer-global"

  group_url = module.mig.mig_id
  ip_name = var.load-balancer-global.ip_name
}