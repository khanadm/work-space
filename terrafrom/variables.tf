variable "access_key" {
        description = "AKIAYEAQBGBHBGTCTNWE"
}
variable "secret_key" {
        description = "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"
}

variable "instance_type" {
        default = "t2.micro"
}



variable "ami_id" {
        description = "The AMI to use"
        type = list
        default = ["ami-053b0d53c279acc90", "ami-026ebd4cfe2c043b2"]
}

variable "number_of_instances" {
        description = "number of instances to be created"
        default = 2
}


variable "aws_vpc_id" {
         description = "aws VPC id"
         default     = "vpc-0d343c0a32a5dd24b"
}


variable "subnet_id" {
        description = "The VPC subnet the instance(s) will be created in"
        default = "subnet-01fac4be25d82c62e"
}


variable "ami_key_pair_name" {
        description = "key pair to use"    
        default = "terraform"
}


variable "user_data_master" {
  type    = string
  default = <<EOF
      #!/bin/bash
      sudo apt-add-repository ppa:ansible/ansible -y
      sudo apt update -y
      sudo apt install ansible -y
  EOF
}


variable "user_data_node" {
  type    = string
  default = <<EOF
      #!/bin/bash
     sudo yum update -y
     sudo yum search docker -y
     sudo yum install docker -y
     sudo systemctl status docker.service
     sudo systemctl start docker.service
     sudo systemctl enable docker.service
     sudo yum update
     sudo yum install git -y
     sudo yum install -y httpd php
     sudo systemctl start  httpd.service
     sudo systemctl enable  httpd.service 
  EOF
}
