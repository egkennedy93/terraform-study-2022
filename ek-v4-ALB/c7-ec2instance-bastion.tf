module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.1.4"

  name = "${local.name}-BastionHost"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
#   monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [ module.bastionsg.security_group_id ] 
  

  tags = local.common_tags
}


