variable "network" {
  type = map(object({
    network_name      = string
    subnets = map(object({
      name             = string
      ip_cidr_range    = string
      region           = optional(string)
    }))
  }))
}

