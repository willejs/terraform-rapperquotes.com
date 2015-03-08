variable "access_key" { 
  description = "AWS access key"
}

variable "secret_key" { 
  description = "AWS secert access key"
}

variable "aws_ssh_key_file" { 
  description = "SSH key for instances"
}

variable "region"     { 
  description = "AWS region"
  default     = "us-east-1" 
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.128.0.0/16"
}

variable "public_subnet_a_cidr" {
  description = "CIDR for public subnet in az a"
  default     = "10.128.0.0/24"
}
variable "public_subnet_b_cidr" {
  description = "CIDR for public subnet in az b"
  default     = "10.128.1.0/24"
}
variable "public_subnet_d_cidr" {
  description = "CIDR for public subnet in az d"
  default     = "10.128.3.0/24"
}
variable "public_subnet_e_cidr" {
  description = "CIDR for public subnet in az c"
  default     = "10.128.2.0/24"
}

variable "private_subnet_a_cidr" {
  description = "CIDR for private subnet in az a"
  default     = "10.128.4.0/24"
}
variable "private_subnet_b_cidr" {
  description = "CIDR for private subnet in az b"
  default     = "10.128.5.0/24"
}
variable "private_subnet_d_cidr" {
  description = "CIDR for private subnet in az c"
  default     = "10.128.6.0/24"
}
variable "private_subnet_e_cidr" {
  description = "CIDR for private subnet in az d"
  default     = "10.128.7.0/24"
}

/* Ubuntu 14.04 amis */
variable "amis" {
  description = "Ubuntu Cloud AMI - HVM only"
  default = { 
    us-east-1 = "ami-6089d208"
  }
}