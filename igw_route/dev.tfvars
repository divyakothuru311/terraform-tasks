first_vpc    = "10.10.0.0/16"
subnet_names = ["web", "app", "db"]
web_security_group_config = {
  name        = "websg"
  description = "this is web sg"
  rules = [{
    type       = "ingress"
    from_port  = 80
    to_port    = 80
    protocol   = "Tcp"
    cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = 22
      to_port    = 22
      protocol   = "Tcp"
      cidr_block = "0.0.0.0/0"
    },

  ]
}
app_security_group_config = {
  name        = "appsg"
  description = "this is app sg"
  rules = [{
    type       = "ingress"
    from_port  = 80
    to_port    = 80
    protocol   = "Tcp"
    cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = 22
      to_port    = 22
      protocol   = "Tcp"
      cidr_block = "0.0.0.0/0"
    }
  ]

}
db_security_group_config = {
  name        = "dbsg"
  description = "this is db sg"
  rules = [{
    type       = "ingress"
    from_port  = 3306
    to_port    = 3306
    protocol   = "Tcp"
    cidr_block = "10.10.0.0/16"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = -1
      cidr_block = "10.10.0.0/16"
    }
  ]

}