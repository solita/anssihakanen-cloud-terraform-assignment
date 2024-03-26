variable "rg" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type    = string
  default = "West Europe"
}

variable "owner" {
  type    = string
  default = "anssi.hakanen@solita.fi"
}

variable "dueDate" {
  type    = string
  default = "2024-05-01"
}
