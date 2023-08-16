resource "aws_vpc" "vpc_new" {
  cidr_block = var.first_vpc
  tags = {
    Name = local.Name
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.subnet_names)
  vpc_id     = aws_vpc.vpc_new.id
  cidr_block = cidrsubnet(var.first_vpc, 8, count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [aws_vpc.vpc_new]
}

