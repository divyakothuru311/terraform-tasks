resource "aws_security_group" "web" {
  name        = "web"
  vpc_id      = aws_vpc.vpc_new.id
  description = "this is web security group"
  tags = {
    Name = "websg"
  }
}
resource "aws_security_group_rule" "web_http" {
  security_group_id = aws_security_group.web.id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group_rule" "web_ssh" {
  security_group_id = aws_security_group.web.id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}
resource "aws_security_group" "app" {
  name        = "app"
  vpc_id      = aws_vpc.vpc_new.id
  description = "this is app security group"
  tags = {
    Name = "appsg"
  }
}
resource "aws_security_group_rule" "app_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app.id
}
resource "aws_security_group" "db" {
  name        = "db"
  vpc_id      = aws_vpc.vpc_new.id
  description = "this is app security group"
  tags = {
    Name = "dbsg"
  }
}
resource "aws_security_group_rule" "data" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["10.10.0.0/16"]
  security_group_id = aws_security_group.db.id
}
resource "aws_security_group_rule" "datab" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["10.10.0.0/16"]
  security_group_id = aws_security_group.db.id
}