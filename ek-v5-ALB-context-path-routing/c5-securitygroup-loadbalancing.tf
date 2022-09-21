module "loadbalancer_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.13.0"

    name = "loadbalancer-sg"
    description = "SG for loadbalancer, HTTP"
    vpc_id = module.vpc.vpc_id
    ingress_rules = ["http-80-tcp", "https-443-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]
    egress_rules = ["all-all"]
    tags = local.common_tags

    ingress_with_cidr_blocks = [
        {
            from_port = 81
            to_port = 81
            protocol = 6
            description = "81 from internet"
            cidr_block = "0.0.0.0/0"
        }
    ]
}