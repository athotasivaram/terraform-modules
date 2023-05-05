/*
resource "aws_vpc" "dev" {
  cidr_block = var.cidr # allow this cidr override users
  instance_tenancy = "default"
}
*/

resource "aws_vpc" "dev" {
  cidr_block = local.cidr # don't allow this cidr override users
  instance_tenancy = "default"
  tags = var.tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev.id # internet gateway depends on VPC
  tags = var.igw_tags
}


resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.dev.id # it will fetch VPC ID created from above code
  cidr_block = var.cidr_public_subnet
  tags = var.public_subnet_tags
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.dev.id # it will fetch VPC ID created from above code
  cidr_block = var.cidr_private_subnet
  tags = var.private_subnet_tags
}

resource "aws_subnet" "db_subnet" {
  vpc_id     = aws_vpc.dev.id # it will fetch VPC ID created from above code
  cidr_block = "10.0.3.0/24"
  tags = var.db_subnet_tags
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.dev.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = var.public_rt_tags
}

resource "aws_eip" "eip" {}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public.id
  tags = var.nat_gw_tags
  depends_on = [aws_internet_gateway.igw]
  }

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.dev.id   #for private route we don't attach IGW, we attach NAT
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }
  tags = var.private_rt_tags
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_route_table_association" "db" {
  subnet_id      = aws_subnet.db_subnet.id
  route_table_id = aws_route_table.private-rt.id
}




