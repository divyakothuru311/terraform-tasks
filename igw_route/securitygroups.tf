resource "aws_security_group" "web" {
  name        = var.web_security_group_config.name
  vpc_id      = aws_vpc.vpc_new.id
  description = var.web_security_group_config.description
  depends_on = [
    aws_vpc.vpc_new
  ]
}
resource "aws_security_group_rule" "web_http" {
  count             = length(var.web_security_group_config.rules)
  security_group_id = aws_security_group.web.id
  type              = var.web_security_group_config.rules[count.index].type
  from_port         = var.web_security_group_config.rules[count.index].from_port
  to_port           = var.web_security_group_config.rules[count.index].to_port
  protocol          = var.web_security_group_config.rules[count.index].protocol
  cidr_blocks       = [var.web_security_group_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.web
  ]
}
resource "aws_security_group_rule" "web_ssh" {
  count             = length(var.web_security_group_config.rules)
  security_group_id = aws_security_group.web.id
  type              = var.web_security_group_config.rules[count.index].type
  from_port         = var.web_security_group_config.rules[count.index].from_port
  to_port           = var.web_security_group_config.rules[count.index].to_port
  protocol          = var.web_security_group_config.rules[count.index].protocol
  cidr_blocks       = [var.web_security_group_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.web
  ]
}
resource "aws_security_group" "app" {
  name        = var.app_security_group_config.name
  vpc_id      = aws_vpc.vpc_new.id
  description = var.app_security_group_config.description
  depends_on = [
    aws_vpc.vpc_new
  ]
}
resource "aws_security_group_rule" "app_http" {
  count             = length(var.app_security_group_config.rules)
  security_group_id = aws_security_group.app.id
  type              = var.app_security_group_config.rules[count.index].type
  from_port         = var.app_security_group_config.rules[count.index].from_port
  to_port           = var.app_security_group_config.rules[count.index].to_port
  protocol          = var.app_security_group_config.rules[count.index].protocol
  cidr_blocks       = [var.app_security_group_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.app
  ]
}
resource "aws_security_group_rule" "app_ssh" {
  count             = length(var.app_security_group_config.rules)
  security_group_id = aws_security_group.app.id
  type              = var.app_security_group_config.rules[count.index].type
  from_port         = var.app_security_group_config.rules[count.index].from_port
  to_port           = var.app_security_group_config.rules[count.index].to_port
  protocol          = var.app_security_group_config.rules[count.index].protocol
  cidr_blocks       = [var.app_security_group_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.app
  ]
}
resource "aws_security_group" "db" {
  name        = var.db_security_group_config.name
  vpc_id      = aws_vpc.vpc_new.id
  description = var.db_security_group_config.description
  depends_on = [
    aws_vpc.vpc_new
  ]
}
resource "aws_security_group_rule" "db1" {
  count             = length(var.db_security_group_config.rules)
  security_group_id = aws_security_group.db.id
  type              = var.db_security_group_config.rules[count.index].type
  from_port         = var.db_security_group_config.rules[count.index].from_port
  to_port           = var.db_security_group_config.rules[count.index].to_port
  protocol          = var.db_security_group_config.rules[count.index].protocol
  cidr_blocks       = [var.db_security_group_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.db
  ]
}
resource "aws_security_group_rule" "db" {
  count             = length(var.db_security_group_config.rules)
  security_group_id = aws_security_group.db.id
  type              = var.db_security_group_config.rules[count.index].type
  from_port         = var.db_security_group_config.rules[count.index].from_port
  to_port           = var.db_security_group_config.rules[count.index].to_port
  protocol          = var.db_security_group_config.rules[count.index].protocol
  cidr_blocks       = [var.db_security_group_config.rules[count.index].cidr_block]

  depends_on = [
    aws_security_group.db
  ]
}