output "ec2_bastion_public_instance_ids" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}

output "ec2_bastion_public_ip" {
    description = " list of publicIP names assigned to the instances"
    value       = module.ec2_public.public_ip
}



#private 
output "ec2_private_instance_ids" {
  description = "The ID of the instance"
  value       = module.ec2_private.id
}

output "ec2_private_ip" {
    description = " list of publicIP names assigned to the instances"
    value       = module.ec2_private.public_ip
}

