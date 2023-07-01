provider "aws" {
  profile = "default"
  region  = "eu-north-1"
}

resource "aws_security_group" "allow_tls" {
    name        = "allow_tls"
    description = "security group"

    vpc_id = "${var.aws_vpc_id}"

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


resource "aws_instance" "ec2_instance" {
    ami = element(var.ami_id, count.index)
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ami_key_pair_name}"
    vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
    tags = {
        "Name"      = count.index == 0 ? "ansible-master" : count.index == 1 ? "ansible-node1" : "ansible-node2"
        "AMI_ID"    = element(var.ami_id, count.index)
        
    }
   
    user_data = count.index == 0 ? var.user_data_master : count.index == 1 ? var.user_data_node1 : var.user_data_node2

}
