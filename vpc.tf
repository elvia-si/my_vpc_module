resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = var.internet_gw_name
  }
}

# PUBLIC SUBNET
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.public_cidr_a
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true

  tags = tomap(
      { "Name" = lower(format("subnet-%s", var.environment_name)) }
    )
}


# # ELASTIC IP _ PUBLIC NAT GATEWAY
# #ELASTIC NAT GATEWAY A
# resource "aws_eip" "nat_a_eip" {
#   #instance = aws_instance.web.id
#   vpc      = true
# }

# #PUBLIC NAT GATEWAY A
# resource "aws_nat_gateway" "nat_a" {
#   allocation_id = aws_eip.nat_a_eip.id
#   subnet_id     = aws_subnet.public_a.id

#   tags = {
#     Name = "PUBLIC A NAT Gateway"
#   }

#   # To ensure proper ordering, it is recommended to add an explicit dependency
#   # on the Internet Gateway for the VPC.
#   depends_on = [aws_internet_gateway.internet_gateway]
# }

# ## PRIVATE subnet for Elastisearch, logstash
# resource "aws_subnet" "private_a" {
#   vpc_id     = aws_vpc.main_vpc.id
#   cidr_block = var.private_cidr_a
#   availability_zone = "${var.region}a"

#   tags = {
#     Name = "elk-private-a"
#   }
# }

# ## PRIVATE Subnet for test
# resource "aws_subnet" "private_b" {
#   vpc_id     = aws_vpc.main_vpc.id
#   cidr_block = var.private_cidr_b
#   availability_zone = "${var.region}a"

#   tags = {
#     Name = "elk-private-b"
#   }
# }

#US-EAST-1

resource "aws_vpc" "my_vpc_east" {
  provider = aws.east
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "internet_gateway_east" {
  provider = aws.east
  vpc_id = aws_vpc.my_vpc_east.id

  tags = {
    Name = var.internet_gw_name
  }
}

# PUBLIC SUBNET
resource "aws_subnet" "public_a_east" {
  provider = aws.east
  vpc_id                  = aws_vpc.my_vpc_east.id
  cidr_block              = var.public_cidr_a
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = tomap(
      { "Name" = lower(format("subnet-%s", var.environment_name)) }
    )
}