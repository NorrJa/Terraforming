variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "standard_b2ms"
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password for the virtual machine."
  type        = string
  default     = "Password1234!"
  sensitive   = true
}