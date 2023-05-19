module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "terraform-loadbalancer"


  load_balancer_type = "application"

  vpc_id = module.vpc.vpc_id
  subnets = [
    module.vpc.public_subnets[0],
    module.vpc.public_subnets[1],
    module.vpc.public_subnets[2]
  ]
  security_groups = [module.vpc.default_security_group_id]

  target_groups = [
    {
      name             = "terraform-targetgroup"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "instance"
      health_check = {
        protocol = "HTTP"
        path     = "/health-check"
      }
      targets = {
        public_1 = {
          target_id = module.ec2_instance[0].id
        }
        public_2 = {
          target_id = module.ec2_instance[1].id
        }
        public_3 = {
          target_id = module.ec2_instance[2].id
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

}

resource "aws_security_group_rule" "lb-ingress-3000-ip4" {
  security_group_id = module.alb.security_group_id
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "lb-ingress-3000-ip6" {
  security_group_id = module.alb.security_group_id
  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  ipv6_cidr_blocks  = ["::/0"]
}

resource "aws_security_group_rule" "lb-ingress-80-ip4" {
  security_group_id = module.alb.security_group_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "lb-ingress-80-ip6" {
  security_group_id = module.alb.security_group_id
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  ipv6_cidr_blocks  = ["::/0"]
}

resource "aws_security_group_rule" "lb-ingress-22" {
  security_group_id = module.alb.security_group_id
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["84.232.135.193/32"]
}
