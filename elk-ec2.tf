resource "aws_instance" "elk-node-1" {

  count = 2

  ami = "ami-05c96317a6278cfaa"
  instance_type = "t2.micro"
  key_name = "master-key"
  user_data = "${file("user_data.sh")}"
  vpc_security_group_ids = [aws_security_group.dxm-logstash-sg.id]

  tags = {
    Name = var.node_names[count.index]
  }

}