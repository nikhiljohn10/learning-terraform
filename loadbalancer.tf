module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name    = "blog-alb"

  load_balancer_type = "application"

  vpc_id             = module.blog_vpc.vpc_id
  subnets            = module.blog_vpc.public_subnets
  security_groups    = [module.blog_sg.security_group_id]

  target_groups = [
    {
      name_prefix      = "blog-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target   = {
          target_id = aws_instance.blog.id
          port      = 80
        }
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Environment = "dev"
  }
}

module "autoscaling" {
  source    = "terraform-aws-modules/autoscaling/aws"
  version   = "6.7.0"
  
  name      = "blog"
  min_size  = 1
  max_size  = 2

  vpc_zone_identifier = module.blog_vpc.public_subnets
  target_group_arns   = module.blog_alb.target_group_arns
  security_groups     = [module.blog_sg.security_group_id]
  image_id            = data.aws_ami.app_ami.id
  instance_type       = var.instance_type
}
