variable "vpc_network_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "vpc network cidr range"
}

variable "subnet_network" {
  type        = string
  default     = "10.10.0.0/24"
  description = "this is subnet network"
}

variable "subnet_network1" {
  type        = string
  default     = "10.10.1.0/24"
  description = "this is subnet network1"
}

variable "subnet_network2" {
  type        = string
  default     = "10.10.2.0/24"
  description = "this is subnet network2"
}

variable "subnet_network3" {
  type        = string
  default     = "10.10.3.0/24"
  description = "this is subnet network3"
}
