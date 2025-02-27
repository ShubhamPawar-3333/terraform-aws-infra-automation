# Security Group for Bastion
resource "aws_security_group" "bastion" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your IP for security
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "bastion-sg"
  }
}

# Bastion EC2 Instance
resource "aws_instance" "bastion" {
  ami           = "ami-00bb6a80f01f03502"  # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type, ap-south-1 (check latest)
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet_id
  key_name      = var.key_name
  security_groups = [aws_security_group.bastion.id]
  associate_public_ip_address = true
  tags = {
    Name = "bastion-host"
  }
}