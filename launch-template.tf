resource "aws_launch_template" "terraform_lt" {
  name          = "terraform_lt"
  image_id      = "ami-09744628bed84e434"
  instance_type = "t2.micro"
  key_name      = "learner-api-keypair"
  user_data     = filebase64("./user-data.sh")
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [module.alb.security_group_id]
  }
}

