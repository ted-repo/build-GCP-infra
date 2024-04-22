# variable "project_name" {
#   type = string
# }

variable "network_name" {
  type = string
}

variable "subnets" {
  type = map(object({
    name          = string
    ip_cidr_range = string
    region        = string
  }))
}