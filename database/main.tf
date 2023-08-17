resource "aws_vpc" "newvpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = local.Name
  }
}
resource "aws_subnet" "subnets" {
  count             = length(var.subnet_names)
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = var.subnet_az[count.index]
  vpc_id            = aws_vpc.newvpc.id
  tags = {
    Name = var.subnet_names[count.index]
  }
  depends_on = [aws_vpc.newvpc]
}
data "aws_route_table" "default" {
  vpc_id     = aws_vpc.newvpc.id
  depends_on = [aws_vpc.newvpc]
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.newvpc.id
  tags = {
    Name = "newgw"
  }
  depends_on = [aws_vpc.newvpc]
}
resource "aws_route" "igw" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.gw.id
  depends_on = [
    aws_vpc.newvpc,
  aws_internet_gateway.gw]
}