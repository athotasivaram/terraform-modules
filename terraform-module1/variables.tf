variable "vpc_cidr" {
  type = string # we are not giving any default user must provide this
}

variable "tags" { # these are common tags, you can apply for all resources in this module
  type = map
}

variable "vpc_tags" {
  type = map
  default = {}  # this is optional
}

variable "azs" {
  type = list
}

variable "public_subnet_cidr" {
  type = list
}

variable "public_subnet_tags" {
  type = map
  default = {}
}

variable "public_subnet_names" {
  type = list
}

variable "igw_tags" {
  type = map
  default = {}
}

variable "public_route_tags" {
  type = map
  default = {}
}

variable "public_route_name" {}

variable "private_subnet_cidr" {
  type = list
}

variable "private_subnet_names" {}

variable "private_subnet_tags" {
  type = map
  default = {}
}

variable "nat_tags" {
  type = map
  default = {}
}

variable "private_route_tags" {
  type = map
  default = {}
}

variable "private_route_name" {}

variable "database_subnet_cidr" {
  type = list
}

variable "database_subnet_names" {}

variable "database_subnet_tags" {
  type = map
  default = {}
}

variable "database_route_tags" {
  type = map
  default = {}
}

variable "database_route_name" {}

variable "db_group" {
  type = map
  default = {}
}