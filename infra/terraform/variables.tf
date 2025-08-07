variable "region" {
  description = "Região AWS"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Prefixo para nomear recursos"
  type        = string
  default     = "flask-devops"
}
