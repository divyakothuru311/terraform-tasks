variable "first_vpc" {
  type        = string
  description = "this is vpc cidr"

}
variable "subnet_names" {
  type        = list(string)
  description = "these are subnet names"
}
variable "web_security_group_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is web security group"
}
variable "app_security_group_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is app security group"
}
variable "db_security_group_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "this is db security group"
}