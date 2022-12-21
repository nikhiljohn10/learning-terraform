output "instance_ami" {
  value = aws_instance.blog.ami
}

output "instance_arn" {
  value = aws_instance.blog.arn
}

output "blog_url" {
  value = aws_instance.blog.public_dns
}

output "blog_ip" {
  value = aws_instance.blog.public_ip
}
