# ssh to the GCP instance:
# gcloud compute ssh <instance_name>

provider "google" {
  project     = var.project_id
  credentials = var.credential_file
}
resource "google_compute_instance" "default" {
  name         = var.instance_name
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
