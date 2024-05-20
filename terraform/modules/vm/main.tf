resource "google_compute_instance" "instance" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone         = var.zone

  #tags = ["foo", "bar"] # network tags

  boot_disk {
    initialize_params {
      image = var.boot_disk[0].name
      labels = {
        my_label = var.boot_disk[0].my_label
      }
    }
  }

# Allows multiple nics
  dynamic "network_interface" {
    for_each = var.network_interface
    content {
      network    = network_interface.value.network
      subnetwork = network_interface.value.subnetwork

      access_config {
        // Ephemeral public IP
      }
    }
  }


}