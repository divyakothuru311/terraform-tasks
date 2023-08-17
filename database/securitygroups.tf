resource "aws_security_group" "web" {
  name        = var.websecurity_group_config.name
  description = var.websecurity_group_config.description
  vpc_id      = aws_vpc.newvpc.id
  depends_on  = [aws_vpc.newvpc]
  tags = {
    Name = local.web
  }
}
resource "aws_security_group_rule" "web1" {
  count             = length(var.websecurity_group_config.rules)
  security_group_id = aws_security_group.web.id
  type              = var.websecurity_group_config.rules[count.index].type
  from_port         = var.websecurity_group_config.rules[count.index].from_port
  to_port           = var.websecurity_group_config.rules[count.index].to_port
  protocol          = var.websecurity_group_config.rules[count.index].protocol
  cidr_blocks       = [var.websecurity_group_config.rules[count.index].cidr_block]
  depends_on = [
    aws_security_group.web
  ]
}

resource "aws_security_group" "app" {
  name        = var.appsecurity_group_config.name
  description = var.appsecurity_group_config.description
  vpc_id      = aws_vpc.newvpc.id
  depends_on  = [aws_vpc.newvpc]
  tags = {
    Name = local.app
  }
}
resource "aws_security_group_rule" "app1" {
  count             = length(var.appsecurity_group_config.rules)
  security_group_id = aws_security_group.app.id
  type              = var.appsecurity_group_config.rules[count.index].type
  from_port         = var.appsecurity_group_config.rules[count.index].from_port
  to_port           = var.appsecurity_group_config.rules[count.index].to_port
  protocol          = var.appsecurity_group_config.rules[count.index].protocol
  cidr_blocks       = [var.appsecurity_group_config.rules[count.index].cidr_block]
  depends_on        = [aws_security_group.app]
}

resource "aws_security_group" "db" {
  name        = var.db1security_group_config.name
  description = var.db1security_group_config.description
  vpc_id      = aws_vpc.newvpc.id
  depends_on  = [aws_vpc.newvpc]
  tags = {
    Name = local.db1
  }
}
resource "aws_security_group_rule" "rds" {
  count             = length(var.db1security_group_config.rules)
  security_group_id = aws_security_group.db.id
  type              = var.db1security_group_config.rules[count.index].type
  from_port         = var.db1security_group_config.rules[count.index].from_port
  to_port           = var.db1security_group_config.rules[count.index].to_port
  protocol          = var.db1security_group_config.rules[count.index].protocol
  cidr_blocks       = [var.db1security_group_config.rules[count.index].cidr_block]
  depends_on        = [aws_security_group.db]
}
resource "aws_security_group" "dbt" {
  name        = var.db2security_group_config.name
  description = var.db2security_group_config.description
  vpc_id      = aws_vpc.newvpc.id
  depends_on  = [aws_vpc.newvpc]
  tags = {
    Name = local.db2
  }
}
resource "aws_security_group_rule" "db2" {
  count             = length(var.db2security_group_config.rules)
  security_group_id = aws_security_group.dbt.id
  type              = var.db2security_group_config.rules[count.index].type
  from_port         = var.db2security_group_config.rules[count.index].from_port
  to_port           = var.db2security_group_config.rules[count.index].to_port
  protocol          = var.db2security_group_config.rules[count.index].protocol
  cidr_blocks       = [var.db2security_group_config.rules[count.index].cidr_block]
  depends_on        = [aws_security_group.db]
}
