# VPC
variable "cluster_name" {
  description = "ECS hogehoge cluster Name"
  default     = ""
}

variable "alb_port" {
  description = "Origin Application Load Balancer Port"
}

# Pipeline
variable "container_port" {
  description = "Destination Application Load Balancer Port"
}

variable "app_repository_name" {
  description = "ECR repository name"
  default     = ""
}

variable "container_name" {
  description = "Container app name"
  default     = ""
}

variable "git_repository" {
  type        = "map"
  description = "git repository variables"

  default = {
    owner  = ""
    name   = ""
    branch = "master"
  }
}

variable "helth_check_path" {
  description = "target group helth check path"
  default     = "/"
}

# ECS
variable "desired_tasks" {
  description = "Number of containers desired to run app task"
  default     = 2
}

variable "min_tasks" {
  description = "Minimum"
  default     = 2
}

variable "max_tasks" {
  description = "Maximum"
  default     = 4
}

variable "cpu_to_scale_up" {
  description = "CPU % to Scale Up the number of containers"
  default     = 80
}

variable "cpu_to_scale_down" {
  description = "CPU % to Scale Down the number of containers"
  default     = 30
}

variable "desired_task_cpu" {
  description = "Desired CPU to run your tasks"
  default     = "256"
}

variable "desired_task_memory" {
  description = "Desired memory to run your tasks"
  default     = "512"
}

variable "environment_variables" {
  type        = "map"
  description = "ecs task environment variables"

  default = {
    KEY = "value"
  }
}
