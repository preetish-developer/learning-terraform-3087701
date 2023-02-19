resource "aws_security_group" "dxm-logstash-sg" {
  
  name        = "dxm-logstash-sg"
  description = "SG for logstash instance"
}

resource "aws_security_group_rule" "for_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = "0.0.0.0/0"
  
  security_group_id = aws_security_group.dxm-logstash-sg.id
}