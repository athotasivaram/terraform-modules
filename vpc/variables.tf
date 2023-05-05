/*
variable "cidr" {
  type = string
  default = "10.0.0.0/16"
}
*/

variable "tags" {
  type = map
  default = {
    Name = "vpc"
  }
}

variable "igw_tags" {
  type = map
  default = {
    Name = "internet-gateway"
  }
}

variable "cidr_public_subnet" {
  type = string
  default = "10.0.1.0/24"
}

variable "public_subnet_tags" {
  type = map
  default = {
    Name = "public_subnet_togs"
  }
}

variable "cidr_private_subnet" {
  type = string
  default = "10.0.2.0/24"
}

variable "private_subnet_tags" {
  type = map
  default = {
    Name = "private_subnet_togs"
  }
}

variable "public_rt_tags" {
  type = map
  default = {
    Name = "public_route_table"
  }
}

variable "nat_gw_tags" {
  type = map
  default = {
    Name = "Nat_gateway"
  }
}

variable "private_rt_tags" {
  type = map
  default = {
    Name = "private_rute_table"
  }
}

variable "db_subnet_tags" {
  type = map
  default = {
    Name = "DB-subnet"
  }
}