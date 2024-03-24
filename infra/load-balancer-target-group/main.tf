variable "lb_target_group_name" {}
variable "lb_target_group_port" {}
variable "lb_target_group_protocol" {}
variable "vpc_id" {}
variable "ec2_instance_id" {}

output "dev_proj_1_lb_target_group_arn" {
  value = aws_lb_target_group.dev_proj_1_lb_target_group.arn
}

resource "aws_lb_target_group" "dev_proj_1_lb_target_group" {
  name     = var.lb_target_group_name 
  port     = var.lb_target_group_port // Port on which targets receive traffic , unless overridden when registering a specific target (in target_grp_attachment).
  protocol = var.lb_target_group_protocol // Protocol to use for routing traffic to the targets
  vpc_id   = var.vpc_id
  health_check {
    path = "/health" // Destination for the health check request
    port = 5000
    healthy_threshold = 6
    unhealthy_threshold = 2
    timeout = 2 // time, in seconds, during which no response from a target means a failed health check
    interval = 5
    matcher = "200" // The HTTP codes to use when checking for a successful response from a target.
  }
}

// defines which targets (such as EC2 instances) are registered with the target group to receive traffic from the ALB
resource "aws_lb_target_group_attachment" "dev_proj_1_lb_target_group_attachment" {
  target_group_arn = aws_lb_target_group.dev_proj_1_lb_target_group.arn
  target_id        = var.ec2_instance_id
  port             = 5000 // port on which targets(python app) receive traffic. 
}