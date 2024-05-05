# Create AWS Key Pair
resource "aws_key_pair" "citadel-key" {
  key_name   = "citadel"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD2JLJkwY19ZMZAHvr+h76sxjz1jA2AsRlXaOOBOo/mh9foXoxJ6FZYGUIRbcaahZ6g3jyQ8Ck6/Fd6l/sOW23F4WMOb7tKIanbOHWTvXYD0PMF1q1ctC1Nzmg2AxN1dDIzs8i37gVFnZ8nVY522Ay6RXheB1Ro6wcXdwBVD/nubEX93nuIgrGI5nOzbGXRd8Yv9rsjNR0mMFQA4WZRPiNNoMrYVuXJFn/U5VeenMqIjDps+efw7UTscjgkKjXuxADq/s7B8tpavTGcqruoYsLYXJVWzc8AY9kvneDFn/+9M78FqOrsaC1Drgn7DlABUD2XiDOjQTjE1POxvt2qbKoP root@iac-server"
}

# Inline variable declarations
variable "ami" {}
variable "instance_type" {}
variable "region" {}

# Create EC2 Instance
resource "aws_instance" "citadel" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.citadel-key.key_name

  tags = {
    Name = "citadel-instance"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_dns} > /root/citadel_public_dns.txt"
  }

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install nginx -y
    systemctl start nginx
    systemctl enable nginx
  EOF
}

# Create Elastic IP
resource "aws_eip" "citadel-eip" {
  vpc = true
}

# Associate Elastic IP with EC2 Instance
resource "aws_eip_association" "citadel-eip-association" {
  instance_id   = aws_instance.citadel.id
  allocation_id = aws_eip.citadel-eip.id
}