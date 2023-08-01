provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

resource "aws_security_group" "php_app_security_group" {
  name        = "php_app_security_group"
  description = "Security group for PHP application"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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

resource "aws_security_group" "mysql_security_group" {
  name        = "mysql_security_group"
  description = "Security group for MySQL"
  vpc_id      = var.aws_vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks = ["${aws_instance.php_app_instance[0].public_ip}/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "php_app_instance" {
  ami                    = var.ami_id
  count                  = 1
  subnet_id              = var.subnet_id
  instance_type          = var.instance_type
  key_name               = var.ami_key_pair_name
  vpc_security_group_ids = [aws_security_group.php_app_security_group.id]
  tags = {
    "Name"   = "php_application"
  }
}

resource "aws_instance" "mysql_instance" {
  ami                    = var.ami_id
  count                  = 1
  subnet_id              = var.subnet_id
  instance_type          = var.instance_type
  key_name               = var.ami_key_pair_name
  vpc_security_group_ids = [aws_security_group.mysql_security_group.id]
  tags = {
    "Name"   = "MySQL"
  }
}

output "instance_ip" {
  value = aws_instance.php_app_instance[0].public_ip
}
