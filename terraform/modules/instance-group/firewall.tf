resource "google_compute_firewall" "rules" {
  name        = var.firewall_name
  direction   = "INGRESS"
  network     = "default"
  priority    = 1000
  description = "Creates http firewall rule to allow health check"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["130.211.0.0/22", "35.191.0.0/16"]
  target_tags   = ["allow-health-check"]
}