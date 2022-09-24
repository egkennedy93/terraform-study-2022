module rdsdb-sg {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.13.0"

    name = "rdsdb-sg"
    description = "SG RDS DB connectivity"
    vpc_id = module.vpc.vpc_id

    ingress_with_cidr_blocks = [
        {
            from_port       = 3306
            to_port         = 3306
            protocol        = "tcp"
            description     = "MySQL access from within VPC"
            cidr_blocks     = module.vpc.vpc_cidr_block
        }
    ]

    egress_rules = ["all-all"]
    tags = local.common_tags
}