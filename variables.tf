variable "project_id" {
  description = "Project id in GCP"
  type        = string
  default     = "vrgn-playground"
}

variable "credential_file" {
  description = "Location of the credential file"
  type        = string
  default     = "/home/michev/.ssh/vrgn-playground-6bd8dde9f143.json"
}

variable "instance_name_1" {
  type    = string
  default = "k8s-practice-1"
}

variable "instance_name_2" {
  type    = string
  default = "k8s-practice-2"
}

variable "instance_type" {
  type    = string
  default = "e2-standard-2"
}

variable "instance_zone" {
  type    = string
  default = "europe-west4-a"
}

variable "distro_image" {
  type    = string
  default = "debian-cloud/debian-11"
}
