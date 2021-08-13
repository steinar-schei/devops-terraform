provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}

resource "google_compute_network" "vpc_network-1" {
  name                            = "terraform-network-1"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

resource "google_compute_network" "vpc_network-2" {
  name                            = "terraform-network-2"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

resource "google_compute_network_peering" "peering1" {
  name         = "peering1"
  network      = google_compute_network.vpc_network-1.id
  peer_network = google_compute_network.vpc_network-2.id
}

resource "google_compute_network_peering" "peering2" {
  name         = "peering2"
  network      = google_compute_network.vpc_network-2.id
  peer_network = google_compute_network.vpc_network-1.id
}





