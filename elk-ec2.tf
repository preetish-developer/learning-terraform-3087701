# resource "aws_instance" "elk-node-1" {

#   count = 2

#   ami = "ami-05c96317a6278cfaa"
#   instance_type = "t2.micro"
#   key_name = "master-key"
#   user_data = "${file("user_data.sh")}"
#   vpc_security_group_ids = [aws_security_group.dxm-logstash-sg.id]

#   tags = {
#     Name = var.node_names[count.index]
#   }

# }

resource "aws_instance" "for_api_execute" {

  
  
  # For NodeJS
  # ami = "ami-05c96317a6278cfaa"
  # instance_type = "t2.micro"
  
  # For ELK
  ami = "ami-0b1d1cf077dd5fbb0"
  instance_type = "t3a.medium"  
  # user_data = "${file("elk-user-data.sh")}"

  key_name = "master-key"
  vpc_security_group_ids = [aws_security_group.dxm-logstash-sg.id]

  tags = {
    Name = "internal-query"
  }

}

# resource "aws_ebs_volume" "practice_1" {
#   availability_zone = "eu-west-2c"
#   size              = 1

#   tags = {
#     Name = "for practice mount point"
#   }
# }

# resource "aws_ebs_volume" "practice_2" {
#   availability_zone = "eu-west-2c"
#   size              = 1

#   tags = {
#     Name = "for practice mount point"
#   }
# }

# resource "aws_volume_attachment" "practice_volume_1" {

#   device_name = "/dev/sdf"
#   volume_id   = aws_ebs_volume.practice_1.id
#   instance_id = aws_instance.elk-node-1[0].id
# }

# resource "aws_volume_attachment" "practice_volume_2" {

#   device_name = "/dev/sdf"
#   volume_id   = aws_ebs_volume.practice_2.id
#   instance_id = aws_instance.elk-node-1[1].id
# }