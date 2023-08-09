variable "vpc_network_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "this is vpc network cidr"

}

variable "subnet_cidr" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
  description = "this is cidr ranges of subnets"

}
variable "subnet_names" {
  type        = list(string)
  default     = ["web", "web1", "app", "app2"]
  description = "these r subnet names"

}

