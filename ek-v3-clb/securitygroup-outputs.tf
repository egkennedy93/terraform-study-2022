# public SG section


output "public_security_group_id" {
  description = "The ID of the security group"
  value       = module.bastionsg.security_group_id
}

output "public_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.bastionsg.security_group_vpc_id
}

output "public_security_group_name" {
  description = "The name of the security group"
  value       = module.bastionsg.security_group_name
}


# private SG section
output "private_security_group_id" {
  description = "The ID of the security group"
  value       = module.privatesg.security_group_id
}

output "private_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.privatesg.security_group_vpc_id
}

output "private_security_group_name" {
  description = "The name of the security group"
  value       = module.privatesg.security_group_name
}

# loadbalancer section
output "loadbalancer_security_group_id" {
  description = "The ID of the security group"
  value       = module.loadbalancer_sg.security_group_id
}

output "loadbalancer_security_group_vpc_id" {
  description = "The VPC ID"
  value       = module.loadbalancer_sg.security_group_vpc_id
}

output "loadbalancer_security_group_name" {
  description = "The name of the security group"
  value       = module.loadbalancer_sg.security_group_name
}



