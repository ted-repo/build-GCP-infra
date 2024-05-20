resource "random_id" "bucket_prefix" {
  byte_length = 8
}

resource "google_storage_bucket" "state" {
  name                        = "${var.bucket_name}-${random_id.bucket_prefix.hex}"
  location                    = "EU"
  force_destroy               = true
  storage_class               = "STANDARD"
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  soft_delete_policy {
    retention_duration_seconds = 604800
  }
}