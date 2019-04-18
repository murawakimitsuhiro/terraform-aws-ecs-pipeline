module "vpc" {
  source         = "modules/vpc"
  cluster_name   = "${var.cluster_name}"
}

module "pipeline" {
  source              = "modules/pipeline"
  cluster_name        = "${var.cluster_name}"
  container_name      = "${var.container_name}"
  app_repository_name = "${var.app_repository_name}"
  git_repository      = "${var.git_repository}"
  repository_url      = "${module.ecs.repository_url}"
  app_service_name    = "${module.ecs.service_name}"
  vpc_id              = "${module.vpc.vpc_id}"

  subnet_ids = [
    "${module.vpc.public_subnet_1a}",
    "${module.vpc.public_subnet_1b}",
  ]
}

module "ecs" {
  source              = "modules/ecs"
  vpc_id              = "${module.vpc.vpc_id}"
  cluster_name        = "${var.cluster_name}"
  container_name      = "${var.container_name}"
  public_subnet_1a    = "${module.vpc.public_subnet_1a}"
  public_subnet_1b    = "${module.vpc.public_subnet_1b}"
  app_repository_name = "${var.app_repository_name}"
  alb_port            = "${var.alb_port}"
  container_port      = "${var.container_port}"
  min_tasks           = "${var.min_tasks}"
  max_tasks           = "${var.max_tasks}"
  cpu_to_scale_up     = "${var.cpu_to_scale_up}"
  cpu_to_scale_down   = "${var.cpu_to_scale_down}"
  desired_tasks       = "${var.desired_tasks}"
  desired_task_cpu    = "${var.desired_task_cpu}"
  desired_task_memory = "${var.desired_task_memory}"

  helth_check_path      = "${var.helth_check_path}"
  environment_variables = "${var.environment_variables}"

  availability_zones = [
    "${module.vpc.public_subnet_1a}",
    "${module.vpc.public_subnet_1b}",
  ]
}
