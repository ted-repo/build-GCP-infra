
# public ip
resource "google_compute_global_address" "default" {
  name          = var.ip_name
  ip_version    = "IPV4"
}

# health check
resource "google_compute_health_check" "default" {
  name = "http-health-check"

  timeout_sec        = 5
  check_interval_sec = 5
  healthy_threshold  = 2
  unhealthy_threshold = 2

  http_health_check {
    port = 80
    port_specification = "USE_FIXED_PORT" 
    proxy_header       = "NONE"
    request_path       = "/"
  }
}

# backend service
resource "google_compute_backend_service" "default" {
  name                            = "backend-service"
  connection_draining_timeout_sec = 0
  health_checks                   = [google_compute_health_check.default.self_link]
  load_balancing_scheme           = "EXTERNAL_MANAGED" # major change
  port_name                       = "http"
  protocol                        = "HTTP"
  session_affinity                = "NONE"
  timeout_sec                     = 60

  backend {
    group = var.group_url
    balancing_mode  = "UTILIZATION"
    capacity_scaler = 1.0
  }
}

# url map
resource "google_compute_url_map" "default" {
  name            = "urlmap"
  default_service = google_compute_backend_service.default.self_link
}

# http proxy
resource "google_compute_target_http_proxy" "default" {
  name    = "http-proxy"
  url_map = google_compute_url_map.default.self_link
}

# forwarding rule
resource "google_compute_global_forwarding_rule" "default" {
  name                  = "http-proxy-forwarding-rule"
  ip_protocol           = "TCP"
  load_balancing_scheme = "EXTERNAL_MANAGED" # major change
  port_range            = "80-80" # major change
  target                = google_compute_target_http_proxy.default.self_link
  ip_address            = google_compute_global_address.default.self_link
}