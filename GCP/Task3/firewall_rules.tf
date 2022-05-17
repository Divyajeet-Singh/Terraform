#Completed for Demo

resource "google_compute_firewall" "rule-1" {
  project = var.project_id
  name    = "allow-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80", "8080"]
  }

  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

resource "google_compute_firewall" "rule-2" {
  project = var.project_id
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "3389"]
  }

  priority = 1000
  # Google IAP Range
  source_ranges = ["35.235.240.0/20"]
}

resource "google_compute_firewall" "rule-3" {
  project = var.project_id
  name    = "allow-all-internal"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "all"
  }

  priority      = 1000
  source_ranges = ["10.128.0.0/9"]
}