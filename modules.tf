module "blog_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"
  name = "blog_new"

  vpc_id = data.aws_vpc.default.id

  ingress_rules = ["http-80-tcp","https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = ["all-all"]
}
