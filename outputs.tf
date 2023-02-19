output "instance_id" {
  count = 2
  value = aws_instance.elk-node-1[count.index].id
}

