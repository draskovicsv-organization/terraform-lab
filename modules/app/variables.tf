variable "env" {
  type = string
  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "env must be dev or prod."
  }
}

variable "image" {
  type = string
}

variable "host_port" {
  type = number
}

variable "container_port" {
  type    = number
  default = 8080
}

variable "memory_mb" {
  type    = number
  default = 128
}