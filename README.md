# work-space
**This is an interesting project!**


Combination of Jenkins (CI/CD) pipelines, Terraform, Ansible, and Docker.

First, we have to launch one server by using the above user data  under which Jenkins, Ansible, Terraform & git will present.

Then we have to set up a freestyle project which will be Launching two instances from Terraform with

 * Proper tag,
 * Region - eu-north-1
 * OS - RHEL-9.2.0 

**NEED TO CHANGE TERRAFORM VARIABLE WHILE USING THIS CODE**
   - VPC
   - SUBNET
   - KEY PAIR

After that by running ansible playbook which will dockerize the PHP application on the first instance & MySQL database on the second instance.


