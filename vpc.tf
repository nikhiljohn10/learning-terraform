module "blog_vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = var.ver_mod_aws_vpc

  name = var.environment.name
  cidr = "${var.environment.network_prefix}.0.0/16"

  azs             = [
    "${var.region}a",
    "${var.region}b",
    "${var.region}c"
  ]

  public_subnets  = [
    "${var.environment.network_prefix}.101.0/24",
    "${var.environment.network_prefix}.102.0/24",
    "${var.environment.network_prefix}.103.0/24"
  ]

  enable_nat_gateway    = true
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Terraform   = "true"
    Environment = var.environment.name
  }
}
