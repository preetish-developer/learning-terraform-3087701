resource "aws_security_group" "dxm-logstash-sg" {
  
  name        = "dxm-logstash-sg"
  description = "SG for logstash instance"
}

# resource "aws_security_group" "nlb-sg" {
  
#   name        = "dxm-logstash-nlb-sg"
#   description = "SG for Network load balancer"
# }

# resource "aws_security_group_rule" "ingress-for-nlb" {
#   type              = "ingress"
#   from_port         = 443
#   to_port           = 443
#   protocol          = "tcp"
#   cidr_blocks       = ["0.0.0.0/0"]
#   description       = "Ingress for NLB"
  
#   security_group_id = aws_security_group.nlb-sg.id
# }

# resource "aws_security_group_rule" "egress-for-nlb" {
#   type                      = "egress"
#   from_port                 = 9350
#   to_port                   = 9350
#   protocol                  = "tcp"
#   source_security_group_id  = aws_security_group.dxm-logstash-sg.id
#   description               = "Ingress for NLB"
  
#   security_group_id = aws_security_group.nlb-sg.id
# }

resource "aws_security_group_rule" "for_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "to be able to ssh"
  
  security_group_id = aws_security_group.dxm-logstash-sg.id
}

resource "aws_security_group_rule" "for_nodejs" {
  type                      = "ingress"
  from_port                 = 9350
  to_port                   = 9350
  protocol                  = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  # source_security_group_id  = aws_security_group.nlb-sg.id
  description               = "for load balancer"
  
  security_group_id = aws_security_group.dxm-logstash-sg.id
}

resource "aws_security_group_rule" "for_yum_repos" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "for yum repos"
  
  security_group_id = aws_security_group.dxm-logstash-sg.id
}