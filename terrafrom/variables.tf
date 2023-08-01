variable "instance_type" {
        default = "t3.micro"
}

variable "ami_id" {
  description = "The AMI to use"
  type        = string
  default     = "ami-0874ff0d73a3ab8cf"
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

