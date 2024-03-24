variable "domain_name" {}
variable "aws_lb_dns_name" {}
variable "aws_lb_zone_id" {}

data "aws_route53_zone" "dev_proj_1_ayush" {
  name         = var.domain_name
  private_zone = false
}

// create a A record in the hosted zone
resource "aws_route53_record" "lb_record" {
  zone_id = data.aws_route53_zone.dev_proj_1_ayush.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.aws_lb_dns_name // DNS name to which the alias record will point (lb)
    zone_id                = var.aws_lb_zone_id // Specifies the hosted zone ID of the DNS name
    evaluate_target_health = true
  }
}

output "hosted_zone_id" {
  value = data.aws_route53_zone.dev_proj_1_ayush.zone_id
}
