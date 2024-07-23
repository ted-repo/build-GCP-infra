
resource "google_compute_instance_group_manager" "default" {
  name = var.name
  zone = var.zone
  named_port {
    name = "http"
    port = 80
  }
  version {
    instance_template = google_compute_instance_template.instance_template.self_link_unique
    name              = "primary"
  }
  base_instance_name = "vm"
  target_size        = 2
}