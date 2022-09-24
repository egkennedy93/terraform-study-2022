resource "aws_route53_record" "apps_dns" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = "te"
  type    = "A"
  alias {
    name                   = module.alb.this_lb_dns_name
    zone_id                = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "default_dns" {
  zone_id = data.aws_route53_zone.selected.zone_id 
  name    = "myapps101.devopsincloud.com"
  type    = "A"
  alias {
    name                   = module.alb.this_lb_dns_name
    zone_id                = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }  
}

## Testing Host Header - Redirect to External Site from ALB HTTPS Listener Rules
resource "aws_route53_record" "app1_dns" {
  zone_id = data.aws_route53_zone.selected.zone_id 
  name    = "azure-aks101.devopsincloud.com"
  type    = "A"
  alias {
    name                   = module.alb.this_lb_dns_name
    zone_id                = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }  
}

