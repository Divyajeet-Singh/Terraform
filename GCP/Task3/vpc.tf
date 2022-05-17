#Completed for Demo

resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = var.vpc_network
  auto_create_subnetworks = true
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}


resource "google_compute_router" "router" {
  name    = "my-router"
  region  = var.deployment_region
  network = google_compute_network.vpc_network.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}