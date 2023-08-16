variable "first_vpc" {
  type        = string
  default     = "10.10.0.0/16"
  description = "this is vpc cidr"
}
variable "subnet_names" {
  type        = list(string)
  default     = ["web", "app", "db"]
  description = "these are subnet names"

}
