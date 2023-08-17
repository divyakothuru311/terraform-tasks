vpc_cidr        = "10.10.0.0/16"
subnet_names    = ["web", "app", "db1", "db2"]
db_subnet_names = ["db1", "db2"]
subnet_az       = ["ap-south-1a", "ap-south-1b", "ap-south-1c", "ap-south-1a"]
websecurity_group_config = {
  name        = "websg"
  description = "this is websg"
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
appsecurity_group_config = {
  name        = "appsg"
  description = "this is appsg"
  rules = [{
    type       = "ingress"
    from_port  = 8080
    to_port    = 8080
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
db1security_group_config = {
  name        = "db1sg"
  description = "this is db1sg"
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
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}
db2security_group_config = {
  name        = "db2sg"
  description = "this is db2sg"
  rules = [{
    type       = "ingress"
    from_port  = 22
    to_port    = 22
    protocol   = "Tcp"
    cidr_block = "10.10.0.0/16"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}
