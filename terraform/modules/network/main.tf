resource "google_compute_network" "vpc_network" {
  #project                 = var.network.network_name
  name                    = var.network_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnets" {
  for_each = var.subnets

  name          = each.value.name
  ip_cidr_range = each.value.ip_cidr_range
  region        = each.value.region
  network       = google_compute_network.vpc_network.id

}