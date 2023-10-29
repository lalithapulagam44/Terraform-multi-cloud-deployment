resource "google_compute_network" "example" {
  name = "example-network"
  auto_create_subnetworks = false
}

resource "gogle_compute_subnetwork" "example" {
  name = "example-subnetwork"
  ip_cidr_range = "10.0.0.0/24"
  region = "us-central1"
  network = google_compute_network.example.self_link
}

resource "google_compute_firewall" "example" {
  name = "example-firewall"
  network = google_compute_network.example.self_link

  allow {
    protocol = "tcp"
    ports = [22]
  }

  source_ranges = ["0.0.0.0/0"]
} 

resource "google_compute_instance" "example" {
  name = "example-instance"
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = "peojects/debian-cloud/global/images/family/debian-10"
    }
  }

  network_interface {
    subnetwork = google_compute_network.example.self_link

    access_config {
      
    }
  }

  metadata = {
    ssh-keys = "lalitha:${file("~/.ssh/id_rsa.pub")}"
  }
}