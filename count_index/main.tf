resource "aws_vpc" "ntier_vpc" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = local.Name
  }
}

resource "aws_subnet" "subnets" {
  count      = length(var.subnet_names)
  vpc_id     = aws_vpc.ntier_vpc.id
  cidr_block = var.subnet_cidr[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }

  depends_on = [
    aws_vpc.ntier_vpc
  ]
}

