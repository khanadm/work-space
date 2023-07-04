variable "instance_type" {
        default = "t3.micro"
}

variable "ami_id" {
        description = "The AMI to use"
        type = list
        default = ["ami-0989fb15ce71ba39e", "ami-0874ff0d73a3ab8cf", "ami-0874ff0d73a3ab8cf" ]
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 3
}


variable "aws_vpc_id" {
         description = "aws VPC id"
         default     = "vpc-0b662d1be158f4319"
}


variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-0372107fcf4db5fe9"
}


variable "ami_key_pair_name" {
        description = "key pair to use"    
        default = "terrform"
}

variable "php_application_user_data" {
  type = string
  default = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum search docker -y
    sudo yum install docker -y
    sudo systemctl status docker.service
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    sudo yum update
    sudo yum install git -y
    EOF
}

variable "Mysql_user_data" {
  type = string
  default = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum search docker -y
    sudo yum install docker -y
    sudo systemctl status docker.service
    sudo systemctl start docker.service
    sudo systemctl enable docker.service
    sudo yum update
    sudo yum install git -y
    EOF
}

