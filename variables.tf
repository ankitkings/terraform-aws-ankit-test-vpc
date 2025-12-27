variable "vpc_config" {
    description = "To get the VPC configuration details"
    type = object({
        cidr_block       = string
        name            = string
    })

    validation {
      condition = can(cidrnetmask(var.vpc_config.cidr_block))
      error_message = "Invalid CIDR formate for VPC - ${var.vpc_config.cidr_block}"
    }
}

variable "subnet_config" {
  description = "TO get subnet configuration"
  type = map(object({
    cidr_block = string
    availability_zone = string
    public = optional(bool, false)
  }))

  validation {
    condition = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR formate"
  } 
}