module "ec2_private" {
  
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  name = "${local.name}-PrivateHost"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
#   monitoring             = true
  subnet_ids             = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]

  user_data = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [ module.privatesg.security_group_id ]
  instance_count = var.private_instance_count
  

  tags = local.common_tags


}


