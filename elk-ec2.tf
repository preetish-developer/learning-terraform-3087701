resource "aws_instance" "elk-node-1" {

  ami = "ami-05c96317a6278cfaa"
  instance_type = "t2.micro"
  key_name = "master-key"
  user_data = "${file("user_data.sh")}"
  vpc_security_group_ids = dxm-logstash-sg.id

  tags = {
    Name = "dxm-logstash-node-1"
  }

}