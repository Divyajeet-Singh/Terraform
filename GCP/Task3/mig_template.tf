module "vm_mig" {
  source  = "terraform-google-modules/vm/google//modules/mig"
  version = "7.7.0"
  # insert the 4 required variables here
  project_id          = var.project_id
  region              = var.deployment_region
  network             = google_compute_network.vpc_network.name
  instance_template   = module.instance_template.self_link
  autoscaling_enabled = true
  min_replicas        = 1
  max_replicas        = 4
  cooldown_period     = 60
  autoscaler_name     = "python-app"
  hostname            = "python-app"
  named_ports         = [
      {
        name          = "http"
        port          = 80
      }
    ]

  autoscaling_cpu = [
    {
      target = 0.2
    },
  ]

  health_check_name = "mig-https-hc"
  health_check = {
    type                = "http"
    initial_delay_sec   = 30
    check_interval_sec  = 5
    healthy_threshold   = 2
    timeout_sec         = 5
    unhealthy_threshold = 2
    response            = ""
    proxy_header        = "NONE"
    port                = 80
    request             = ""
    request_path        = "/"
    host                = "localhost"
  }
}
