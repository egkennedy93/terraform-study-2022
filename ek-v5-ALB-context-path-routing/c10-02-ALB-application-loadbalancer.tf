module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "5.16.0"

  name = "${local.name}-alb"
  load_balancer_type = "application"
  vpc_id = module.vpc.vpc_id
  subnets = [ module.vpc.public_subnets[0],
              module.vpc.public_subnets[1],
            ]
  security_groups = [module.loadbalancer_sg.security_group_id]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type        = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
      target_group_index = 0
    }
  ]

  target_groups = [
    # App 1
    {
      name_prefix          = "app1-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
        }
      protocol_version = "HTTP1"
      #app1 Target group
      targets = {
        my_app1_vm1 = {
          target_id = module.ec2_private-app1.id[0]
          port      = 80
        },
        my_app1_vm2 = {
          target_id = module.ec2_private-app1.id[1]
          port      = 80
        }
      }
      tags = local.common_tags
    },

    # App 2
    {
      name_prefix          = "app2-"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
      #app1 Target group
      targets = {
        my_app1_vm1 = {
          target_id = module.ec2_private-app2.id[0]
          port      = 80
        },
        my_app1_vm2 = {
          target_id = module.ec2_private-app2.id[1]
          port      = 80
        }
      }
      
    }
  ]
  # https listener index = 0
  https_listeners = [
    {
      port            = 443
      protocol        = "HTTPS"
      certificate_arn = module.acm.acm_certificate_arn
      action_type = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed message"
        status_code  = "200"
        }
    }
  ]
  #https listener rules
  https_listener_rules = [
    # rule-1: /app1* should go to App1 ec2 instances
    {
      https_listener_index = 0
      actions = [
        {
          type = "forward"
          target_group_index = 0
        }
      ]
      conditions = [{
        path_patterns = ["/app1*"]
      }]
    },
    # rule-2: app2 should go to app 2 ec2 instances
    {
      https_listener_index = 0
      actions = [
        {
          type = "forward"
          target_group_index = 1
        }
      ]
      conditions = [{
        path_patterns = ["/app2*"]
      }]
    }

  ]
  tags = local.common_tags
}


