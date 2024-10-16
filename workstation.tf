module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "workstation"

  instance_type          = "t3.medium"
  ami = "ami-0b4f379183e5706b9"   #centos8 ami 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  subnet_id              = "subnet-05153d13c46b51ef8"
  user_data = file("docker.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_tls" {
  name        = "allow all minikube"
  description = "allow all traffic from minikube"

   ingress {
    
    
        description      = "All traffic from VPC"
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
        Name = "allow_all_minkube"
  }

}

data "aws_ami" "devops_ami" {
  most_recent      = true
  name_regex       = "Centos-8-DevOps-Practice"
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

