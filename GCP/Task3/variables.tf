variable "project_id" {
  default = "terraform-project-349713"
}

variable "deployment_region" {
  default = "asia-south2"
}

variable "vpc_network" {
  default = "default"
}

variable "service_account" {
  default = {
    email  = "293965730496-compute@developer.gserviceaccount.com",
    scopes = ["cloud-platform"]
  }
  type = object({
    email  = string,
    scopes = set(string)
  })
}

variable "source_image" {
  default = "python-app-image"
}

variable "source_image_project" {
  default = "stateless-app-demo"
}