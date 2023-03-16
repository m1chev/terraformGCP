# ssh to the GCP instance:
# gcloud compute ssh <instance_name>

provider "google" {
  project     = var.project_id
  credentials = var.credential_file
}

resource "google_compute_firewall" "default" {
  name    = "k8s"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["30000-32767"]
  }

  target_tags= ["k8s"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "k8s-1" {
  name         = var.instance_name_1
  machine_type = var.instance_type
  zone         = var.instance_zone
  tags         = ["ssh","k8s"]

  boot_disk {
    initialize_params {
      image = var.distro_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    network_ip = "10.164.0.29"
    access_config {
    }
  }
}

resource "google_compute_instance" "k8s-2" {
  name         = var.instance_name_2
  machine_type = var.instance_type
  zone         = var.instance_zone
  tags         = ["ssh"]

  boot_disk {
    initialize_params {
      image = var.distro_image
    }
  }

  network_interface {
    # A default network is created for all GCP projects
    network = "default"
    access_config {
    }
  }
}
