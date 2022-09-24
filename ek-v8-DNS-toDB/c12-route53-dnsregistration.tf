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


resource "aws_route53_record" "dns-to-db" {
  zone_id = data.aws_route53_zone.selected.zone_id 
  name    = "dns-to-db.golftripcoursemanager.com"
  type    = "A"
  alias {
    name                   = module.alb.this_lb_dns_name
    zone_id                = module.alb.this_lb_zone_id
    evaluate_target_health = true
  }  
}

