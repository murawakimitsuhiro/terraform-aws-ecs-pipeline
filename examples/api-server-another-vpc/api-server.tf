locals {
  application_name       = "simple-go-ping"
  application_name_lower = "${replace(lower(local.application_name), "/[^a-z0-9]/", "")}"
}

module "vpc" {
  source = "git@github.com:ispec-inc/terraform-aws-vpc-public.git"

  cluster_name = "${local.application_name}"
}

module "ecs-pipeline" {
  source = "../.."

  is_need_vpc      = false
  vpc_id           = "${module.vpc.vpc_id}"
  public_subnet_1a = "${module.vpc.public_subnet_1a}"
  public_subnet_1b = "${module.vpc.public_subnet_1b}"

  cluster_name        = "${local.application_name}"
  app_repository_name = "${local.application_name}"
  container_name      = "${local.application_name}"

  alb_port         = "8005"
  container_port   = "8005"
  helth_check_path = "/ping"

  git_repository = {
    owner  = "murawakimitsuhiro"
    name   = "go-simple-RESTful-api"
    branch = "feature/only-ping"
  }

  #environment_variables = {
  #  GO_SIMPLE_RESTFUL_DBPORT     = "${module.rds-db.this_db_port}"
  #  GO_SIMPLE_RESTFUL_DBHOST     = "${module.rds-db.this_db_instance_address}"
  #  GO_SIMPLE_RESTFUL_DBUSER     = "${module.rds-db.this_db_username}"
  #  GO_SIMPLE_RESTFUL_DBNAME     = "${module.rds-db.this_db_name}"
  #  GO_SIMPLE_RESTFUL_DBPASSWORD = "${module.rds-db.this_db_password}"
  #}
}

#module "rds-db" {
#  source  = "ispec-inc/mysql-utf8/rds"
#  version = "1.1.1"
#
#  db_name  = "${local.application_name_lower}"
#  username = "db_user"
#  password = "roottest"
#
#  vpc_id     = "${module.ecs-pipeline.vpc_id}"
#  subnet_ids = "${module.ecs-pipeline.vpc_public_subnet_ids}"
#}

