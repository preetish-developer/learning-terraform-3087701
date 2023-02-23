resource "aws_lb" "logstash-nlb" {
  name               = "logstash-nlb"
  internal           = true
  load_balancer_type = "network"
  subnets            = ["subnet-0db9f6ca7703275f7","subnet-0a421dd631424f498","subnet-0813f4a73d59f8efe"]

  enable_deletion_protection = false

}

resource "aws_lb_listener" "https-listener" {
  load_balancer_arn = aws_lb.logstash-nlb.arn
  port              = "443"
  protocol          = "TLS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  
  certificate_arn   = "arn:aws:acm:eu-west-2:317138350195:certificate/e593dcd3-fae8-4089-98a3-94b63d065f85"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.logstash-nlb-tg.arn
  }
}

resource "aws_lb_target_group" "logstash-nlb-tg" {
  name     = "logstash-nlb-tg"
  port     = 9350
  protocol = "TCP"
  vpc_id   = "vpc-05fcf95ab8a0060c7"

   lifecycle {
      create_before_destroy = true
      ignore_changes        = [name]
    }
}

resource "aws_lb_target_group_attachment" "node-1" {
  target_group_arn = aws_lb_target_group.logstash-nlb-tg.arn
  target_id        = aws_instance.elk-node-1[0].id
  port             = 9350
}

resource "aws_lb_target_group_attachment" "node-2" {
  target_group_arn = aws_lb_target_group.logstash-nlb-tg.arn
  target_id        = aws_instance.elk-node-1[1].id
  port             = 9350
}