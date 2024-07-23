
variable "network" {
  type = map(object({
    network_name = string
    subnets = map(object({
      name          = string
      ip_cidr_range = string
      region        = optional(string)
    }))
  }))
}

variable "bastion" {
  type = object({
    instance_name = string
    machine_type  = string
    zone          = optional(string)
    tags          = optional(string)
    boot_disk = list(object({
      name     = string
      my_label = optional(string)
    }))
    network_interface = list(object({
      network    = string
      subnetwork = optional(string)
    }))
  })
}

variable "mig" {
  type = object({
    firewall_name = string
    machine_type  = string
    region        = optional(string)
    name          = string
    zone          = string
  })
}

variable "load-balancer-global" {
  type = object({
    ip_name = string
  })
}