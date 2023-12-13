# EC2 Instances
resource "aws_instance" "my_ec2_instances" {
  count                       = var.number_of_instance
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_pair
  subnet_id                   = aws_subnet.auto_subnet[count.index % length(aws_subnet.auto_subnet)].id
  associate_public_ip_address = true # Enables public IP addresses for EC2 instances


  tags = {
    Name = var.instance_names
  }
}

