resource "aws_instance" "elk-node-1" {

  ami = "ami-05c96317a6278cfaa"
  instance_type = "t2.micro"

  tags = {
    Name = "dxm-logstash-node-1"
  }

}