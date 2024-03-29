# VPC
data "aws_availability_zones" "my_azs" {
  state = "available"
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
resource "aws_vpc" "auto_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  instance_tenancy     = "default"
}

resource "aws_internet_gateway" "auto_gw" {
  vpc_id = aws_vpc.auto_vpc.id
}

# Subnets
resource "aws_subnet" "auto_subnet" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.auto_vpc.id
  cidr_block              = element(["172.16.32.0/20", "172.16.64.0/20", "172.16.96.0/20", "172.16.128.0/20"], count.index % 4)
  availability_zone       = element(data.aws_availability_zones.my_azs.names, count.index % length(data.aws_availability_zones.my_azs.names))
  map_public_ip_on_launch = true
}
