variable "vpc_cidr" {
  type        = string
  description = "this is vpc cidr"
}
variable "subnet_names" {
  type        = list(string)
  description = "these are subnet names"
}
variable "db_subnet_names" {
  type        = list(string)
  description = "these are dbsubnet names"
}
variable "subnet_az" {
  type        = list(string)
  description = "these are az for subnets"
}
variable "websecurity_group_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is web security group"
}
variable "appsecurity_group_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is app security group"
}
variable "db1security_group_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is db1 security group"
}
variable "db2security_group_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = string
      to_port    = string
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is db2 security group"
}