output "ec2_bastion_public_instance_ids" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}

output "ec2_bastion_public_ip" {
    description = " list of publicIP names assigned to the instances"
    value       = module.ec2_public.public_ip
}



#private 
output "app1_ec2_private_instance_ids" {
  description = "The ID of the instance"
  value       = module.ec2_private-app1.id
}

output "app1_ec2_private_ip" {
    description = " list of publicIP names assigned to the instances"
    value       = module.ec2_private-app1.public_ip
}

#private app2
output "app2_ec2_private_instance_ids" {
  description = "The ID of the instance"
  value       = module.ec2_private-app2.id
}

output "app2_ec2_private_ip" {
    description = " list of publicIP names assigned to the instances"
    value       = module.ec2_private-app2.public_ip
}

