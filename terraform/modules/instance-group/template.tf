# Deploys the latest image when Terraform runs
data "google_compute_image" "my_image" {
  family  = "debian-12"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "instance_template" {
  name_prefix             = "instance-template-"
  machine_type            = var.machine_type
  region                  = var.region
  #metadata_startup_script = file("${path.module}/scripts/startup.sh")
  # metadata = {
  #   startup-script = "#! /bin/bash\n     sudo apt-get update\n     sudo apt-get install -y nginx\n     sudo service nginx start\n     sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html"
  # }
  metadata = {
    startup-script = <<-EOF
      #! /bin/bash
      sudo apt-get update
      sudo apt-get install -y nginx
      sudo service nginx start
      sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
    EOF
  }
  tags                    = ["allow-health-check"]
  
  network_interface {
    network               = "default"
    subnetwork            = "default" 
    access_config {
      network_tier        = "PREMIUM"
    }
  }

  // boot disk
  disk {
    source_image = data.google_compute_image.my_image.self_link
  }
}