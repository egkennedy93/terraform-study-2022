module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "4.1.0"

  domain_name  = trimsuffix(data.aws_route53_zone.selected.name, ".")
  zone_id      = data.aws_route53_zone.selected.zone_id

  subject_alternative_names = [
    format("*.%s",trimsuffix(data.aws_route53_zone.selected.name, "."))
  ]

  tags = local.common_tags
}

output "this_acm_certificate_arn" {
  description = "The ARN of the certificate"
  value = module.acm.acm_certificate_arn
}


