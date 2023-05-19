# module "ec2_instance" {
#   source = "terraform-aws-modules/ec2-instance/aws"

#   count = 3

#   name = "terraform-exention-ec2-${count.index + 1}"

#   ami                         = "ami-09744628bed84e434"
#   instance_type               = "t2.micro"
#   key_name                    = "learner-api-keypair"
#   monitoring                  = true
#   vpc_security_group_ids      = [module.vpc.default_security_group_id, module.alb.security_group_id]
#   subnet_id                   = module.vpc.public_subnets[count.index]
#   associate_public_ip_address = true

#   user_data_base64 = filebase64("./user-data.sh")

#   tags = {
#     Terraform = "true"
#   }

# }
