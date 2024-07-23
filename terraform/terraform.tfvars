network = {
  # griffin-dev-vpc = {
  #   network_name = "griffin-dev-vpc"
  #   subnets = {
  #     griffin-dev-wp = {
  #       name          = "griffin-dev-wp"
  #       ip_cidr_range = "192.168.16.0/20"
  #     }
  #     griffin-dev-mgmt = {
  #       name          = "griffin-dev-mgmt"
  #       ip_cidr_range = "192.168.32.0/20"
  #     }
  #   }
  # }
  # griffin-prod-vpc = {
  #   network_name = "griffin-prod-vpc"
  #   subnets = {
  #     griffin-prod-wp = {
  #       name          = "griffin-prod-wp"
  #       ip_cidr_range = "192.168.48.0/20"
  #     }
  #     griffin-prod-mgmt = {
  #       name          = "griffin-prod-mgmt"
  #       ip_cidr_range = "192.168.64.0/20"
  #     }
  #   }
  # }
}

# bastion = {
#     instance_name = "kraken-webserver1"
#     machine_type  = "e2-medium"
#     boot_disk = [
#       { name = "debian-12-bookworm-v20240415" }
#     ]
#     network_interface = [
#       { network = "griffin-dev-vpc", subnetwork = "griffin-dev-mgmt" },
#       { network = "griffin-prod-vpc", subnetwork = "griffin-prod-mgmt" }
#     ]
# }

bastion = {
    instance_name = "nucleus-jumphost-448"
    machine_type  = "e2-micro"
    zone          = "us-west3-b"
    boot_disk = [
      { name = "debian-12-bookworm-v20240415" }
    ]
    network_interface = [
      { network = "default" },
    ]
}

mig = {
  firewall_name = "accept-tcp-rule-291"
  machine_type = "e2-medium"
  name         = "lb-backend-example"
  zone         = "us-west3-b"
}

load-balancer-global = {
  ip_name = "lb"
}