#To run this template you need to create an image ("python-app-image") which was pre-created using the source code here --> https://github.com/Divyajeet-Singh/basic-flask-app.git

provider "google" {
  project = var.project_id
  region  = var.deployment_region
}

data "google_compute_instance_template" "generic" {
  name    = "instance-template-python-app"
  project = var.project_id
}

resource "random_string" "suffix" {
  length  = 4
  special = "false"
  upper   = "false"
}