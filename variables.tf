variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "ami_filter" {
  description = "Name filter and owner for AMI"

  type = object({
    name = string
    owner = string
  })

  default = {
    name = "bitnami-tomcat-*-x86_64-hvm-ebs-nami"
    owner = "979382823631"
  }
}

variable "environment" {
  description = "Development Environment"

  type = object({
    name = string
    network_prefix = string
  })

  default = {
    name = "dev"
    network_prefix = "10.0"
  }
}

variable "min_size" {
  description = "Minimum number of instances"
  default = 1
}

variable "max_size" {
  description = "Maximum number of instances"
  default = 2
}

variable "desired_capacity" {
  description = "Desired number of instances"
  default = 1
}

variable "region" {
  description = "Region to deploy"
  default = "ap-south-1"
}

variable "version" {
  description = "Versions of modules and providers"

  type = object({
    mod_aws_sg = string
    mod_aws_alb = string
    mod_aws_vpc = string
    mod_aws_asg = string
  })

  default = {
    mod_aws_sg = "4.16.2"
    mod_aws_alb = "8.2.1"
    mod_aws_vpc = "3.18.1"
    mod_aws_asg = "6.7.0"
  }
}
