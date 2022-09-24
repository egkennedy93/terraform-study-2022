module "ec2_private-app3" {
  
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "2.17.0"

  name = "${local.name}-app3"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
#   monitoring             = true
  subnet_ids             = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]
  ]

  user_data = templatefile("app3-ums-install.tmpl",{rds_db_endpoint = module.rdsdb.db_instance_address})
  tags = local.common_tags


}


