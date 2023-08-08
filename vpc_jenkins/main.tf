resource "aws_vpc" "main" {
  tags = {
    Name = "hello"
  }
  cidr_block = "10.10.0.0/16"
}
resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_network
  tags = {
    Name = "firstsubnet"
  }
  depends_on = [
    aws_vpc.main
  ]
}
resource "aws_subnet" "web1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_network1
  tags = {
    Name = "secondsubnet"
  }
  depends_on = [
    aws_vpc.main
  ]
}
resource "aws_subnet" "app" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_network2
  tags = {
    Name = "thirdsubnet"
  }
  depends_on = [
    aws_vpc.main
  ]

}
resource "aws_subnet" "app1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_network3
  tags = {
    Name = "fourthsubnet"
  }

  depends_on = [
    aws_vpc.main
  ]
}

resource "aws_instance" "hai" {
  ami             = "ami-0f5ee92e2d63afc18"
  instance_type   = "t2.micro"
  security_groups = ["openall"]

  tags = {
    Name = "HelloWorld"
  }
}

