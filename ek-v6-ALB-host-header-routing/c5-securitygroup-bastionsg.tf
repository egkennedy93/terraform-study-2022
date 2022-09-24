module bastionsg {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.13.0"

    name = "public-bastion-sg"
    description = "SG for bastion host connections"
    vpc_id = module.vpc.vpc_id
    ingress_rules = ["ssh-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]
    egress_rules = ["all-all"]
    tags = local.common_tags
}