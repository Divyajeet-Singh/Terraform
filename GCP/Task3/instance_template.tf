module "instance_template" {
  source          = "terraform-google-modules/vm/google//modules/instance_template"
  project_id      = var.project_id
  network         = google_compute_network.vpc_network.name
  service_account = var.service_account
  #Adding IAM permission to the source image is required. Details can be found here --> https://cloud.google.com/compute/docs/images/managing-access-custom-images#get_the_email_address_of_the_service_account
  source_image         = "python-app-image"
  source_image_project = "stateless-app-demo"

  tags = ["python-app"]
}