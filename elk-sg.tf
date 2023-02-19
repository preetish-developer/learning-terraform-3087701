resource "aws_security_group" "dxm-logstash-sg" {
  
  name        = "dxm-logstash-sg"
  description = "SG for logstash instance"
}

resource "aws_security_group_rule" "for_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "to be able to ssh"
  
  security_group_id = aws_security_group.dxm-logstash-sg.id
}

resource "aws_security_group_rule" "for_ssh" {
  type              = "ingress"
  from_port         = 9350
  to_port           = 9350
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  description       = "for node js app"
  
  security_group_id = aws_security_group.dxm-logstash-sg.id
}