resource "aws_key_pair" "idrsa" {
  key_name   = "workshop"
  public_key = file(var.public_key_path)
  tags = {
    CreatedBy = "terraform"
  }
}
# data "aws_subnet" "app" {
#   filter {
#     name   = "tag:Name"
#     values = [var.subnet_names]
#   }

#   depends_on = [
#     aws_subnet.subnets
#   ]
# }
resource "aws_instance" "appserver" {
  ami                         = var.ubuntu_ami_id
  associate_public_ip_address = true
  instance_type               = var.app_ec2_size
  key_name                    = aws_key_pair.idrsa.key_name
  vpc_security_group_ids      = [aws_security_group.app.id]
  subnet_id                   = aws_subnet.subnets[0].id
  tags = {
    Name = "appserver"
  }

  depends_on = [
    aws_subnet.subnets
  ]
}