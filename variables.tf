variable "rg" {
  type        = string
  description = "Name of the resource group"
  default     = "rg-academy2024-anssihakanen"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "sa" {
  type    = string
  default = "saacademyanssihakanen001"
}

variable "container" {
  type    = string
  default = "blobacademyanssihakanen001"
}