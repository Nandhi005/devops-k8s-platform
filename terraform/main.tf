resource "aws_security_group" "k3s_sg" {

  name = "k3s-security-group"
<<<<<<< HEAD

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 3187
    to_port = 31871
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

=======
  
>>>>>>> 0aa4dc9 (code_updated)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress{
    from_port = 3187
    to_port = 3187
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 30000
    to_port     = 32767
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "k3s_server" {

  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t3.small"

  key_name = "project"

  vpc_security_group_ids = [
    aws_security_group.k3s_sg.id
  ]

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name = "k3s-master"
  }
}
