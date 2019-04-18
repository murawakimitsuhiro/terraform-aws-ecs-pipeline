variable "cluster_name" {
  description = "The cluster_name"
}

variable "alb_port" {
  description = "Origin Application Load Balancer Port"
}

# Target Group Load Balancer Port
variable "container_port" {
  description = "Destination Application Load Balancer Port"
}

#variable "db_name" {
#  description = "RDS Mysql Database Name"
#}
#
#variable "db_host" {
#  description = "RDS Mysql Database Name"
#}
#
#variable "db_user" {
#  description = "RDS Mysql Database User"
#}
#
#variable "db_password" {
#  description = "RDS Mysql Database Passward"
#}
