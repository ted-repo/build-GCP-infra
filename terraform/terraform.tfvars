network = {
    griffin-dev-vpc = {
        network_name = "griffin-dev-vpc"
        subnets = {
            griffin-dev-wp = {
                name = "griffin-dev-wp"
                ip_cidr_range = "192.168.16.0/20"
            }
            griffin-dev-mgmt = {
                name = "griffin-dev-mgmt"
                ip_cidr_range = "192.168.32.0/20"
            }
        }
    }
    griffin-prod-vpc = {
        network_name = "griffin-prod-vpc"
        subnets = {
            griffin-prod-wp = {
                name = "griffin-prod-wp"
                ip_cidr_range = "192.168.48.0/20"
            }
            griffin-prod-mgmt = {
                name = "griffin-prod-mgmt"
                ip_cidr_range = "192.168.64.0/20"
            }
        }
    }
}