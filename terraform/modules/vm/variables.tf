variable "instance_name" {
  type = string
}

variable "machine_type" {
  type = string
}

variable "zone" {
  description = "Optional"
  type        = string
}

variable "tags" {
  description = "Optional - A list of network tags to attach to the instance"
  type        = string
}

variable "boot_disk" {
  type = list(object({
    name     = string
    my_label = optional(string)
  }))
}

variable "network_interface" {
  description = "List of values to assign to network_interface"
  type = list(object({
    network    = string
    subnetwork = optional(string)
  }))
}



