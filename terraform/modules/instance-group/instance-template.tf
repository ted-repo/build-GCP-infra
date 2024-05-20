resource "google_compute_instance_template" "instance_template" {
  name_prefix  = "instance-template-"
  machine_type = "e2-medium"
  region       = "us-central1"

  // boot disk
  disk {
    source_image = "debian-cloud/debian-11"
  }
}