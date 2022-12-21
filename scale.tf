
module "blog_asg" {
  source    = "terraform-aws-modules/autoscaling/aws"
  version   = "6.7.0"
  
  name                = "blog"
  min_size            = 1
  max_size            = 2
  desired_capacity    = 1

  vpc_zone_identifier     = module.blog_vpc.public_subnets

  target_group_arns   = module.blog_alb.target_group_arns
  security_groups     = [module.blog_sg.security_group_id]

  image_id            = data.aws_ami.app_ami.id
  instance_type       = var.instance_type
}
