resource "aws_key_pair" "idrsa" {
  key_name   = "workshop"
  public_key = file(var.public_key_path)
  tags = {
    CreatedBy = "terraform"
  }
}
data "aws_subnet" "app" {
  filter {
    name   = "tag:Name"
    values = [var.app_subnet_name]
  }

  depends_on = [
    aws_subnet.subnets
  ]
}
resource "aws_instance" "appserver" {
  ami                         = var.ubuntu_ami_id
  associate_public_ip_address = true
  instance_type               = var.app_ec2_size
  key_name                    = aws_key_pair.idrsa.key_name
  vpc_security_group_ids      = [aws_security_group.app.id]
  subnet_id                   = data.aws_subnet.app.id
  tags = {
    Name = "appserver"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }

  #provisioner "file" {
  # source      = "./installansible.sh"
  #destination = "/tmp/installansible.sh"

  #}

  provisioner "remote-exec" {
    #script = "/tmp/installansible.sh"
    inline = [
      "sudo apt update",
      "sudo apt install software-properties-common -y",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt install ansible -y",
    "ansible-playbook -i hosts nop-playbook.yaml"]

  }

  depends_on = [
    aws_subnet.subnets
  ]
}