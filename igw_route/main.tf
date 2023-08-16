resource "aws_vpc" "vpc_new" {
  cidr_block = var.first_vpc
  tags = {
    Name = local.Name
  }
  depends_on = [
    aws_vpc.vpc_new
  ]
}
resource "aws_subnet" "subnets" {
  vpc_id     = aws_vpc.vpc_new.id
  count      = length(var.subnet_names)
  cidr_block = cidrsubnet(var.first_vpc, 8, count.index)
  tags = {
    Name = var.subnet_names[count.index]
  }
}
data "aws_route_table" "default" {
  vpc_id     = aws_vpc.vpc_new.id
  depends_on = [aws_vpc.vpc_new]

}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc_new.id
  tags = {
    Name = "newvpcigw"
  }
  depends_on = [aws_vpc.vpc_new]

}
resource "aws_route" "igwroute" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = local.open
  gateway_id             = aws_internet_gateway.gw.id
  depends_on = [
    aws_vpc.vpc_new,
    aws_internet_gateway.gw
  ]

}
