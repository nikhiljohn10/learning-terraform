module "blog_asg" {
  source    = "terraform-aws-modules/autoscaling/aws"
  version   = var.ver_mod_aws_asg
  
  name                = "${var.environment.name}-blog"
  min_size            = var.min_size
  max_size            = var.max_size
  desired_capacity    = var.desired_capacity

  vpc_zone_identifier     = module.blog_vpc.public_subnets

  target_group_arns   = module.blog_alb.target_group_arns
  security_groups     = [module.blog_sg.security_group_id]

  image_id            = data.aws_ami.app_ami.id
  instance_type       = var.instance_type
}
