output "public" {
  description = "Public subnets and their IDs"
  value = [
    {
      name = "subnet0"
      id   = module.vpc.public_subnets[0]
    },
    {
      name = "subnet1"
      id   = module.vpc.public_subnets[1]
    },
    {
      name = "subnet2"
      id   = module.vpc.public_subnets[2]
    }
  ]
}

output "security_group_id" {
  description = "Security Group ID"
  value       = module.vpc.default_security_group_id
}
