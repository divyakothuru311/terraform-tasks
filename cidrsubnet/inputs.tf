variable "vpc_network_cidr" {
  default     = "10.10.0.0/16"
  type        = string
  description = "this is a vpc netwrk"
}

variable "subnet_names" {
  type        = list(string)
  default     = ["web", "web1", "app", "app2"]
  description = "These are subnet names"
}