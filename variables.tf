variable "instance_names" {
  description = "Names for instances to create."
  default     = "Terraform Automation"

}

variable "instance_type" {
  description = "The instance type to use"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The ami to be used"
  default     = "ami-0f8e81a3da6e2510a"
}

variable "number_of_instance" {
  description = "The number of instances to create"
  default     = 1
}

variable "key_pair" {
  default = "ayoterraformkey"
}

variable "vpc_cidr" {
  default = "172.16.0.0/16"
}

variable "az_count" {
  default = 2
}

variable "subnet_count" {
  default = 1
}
