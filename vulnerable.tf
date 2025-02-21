provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "bad_sg" {
  name        = "bad_security_group"
  description = "This security group is too permissive"

  # 🚨 Vulnerável: Permite acesso SSH de qualquer lugar
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 🚨 Vulnerável: Permite acesso HTTP de qualquer lugar
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # 🚨 Vulnerável: Permite acesso total na saída
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
