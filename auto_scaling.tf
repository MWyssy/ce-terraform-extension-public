resource "aws_autoscaling_group" "terraform_asg" {

  name = "terraform-asg"
  launch_template {
    id      = aws_launch_template.terraform_lt.id
    version = "$Latest"
  }
  min_size            = 2
  max_size            = 5
  desired_capacity    = 3
  vpc_zone_identifier = [module.vpc.public_subnets[0], module.vpc.public_subnets[1], module.vpc.public_subnets[2]]
  target_group_arns   = [module.alb.target_group_arns[0]]

}
