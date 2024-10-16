# module "minikube" {
#   source = "github.com/scholzj/terraform-aws-minikube"
            

#   aws_region    = "us-east-1"
#   cluster_name  = "roboshop"
#   aws_instance_type = "t3.medium"
#   # ~ --> home dir, you should have nishal.pub in your home
#   ssh_public_key = "~/nishal.pub" # replace with your public key name and path
#   ami_image_id = "ami-b81dbfc5"
#   aws_subnet_id = "subnet-05153d13c46b51ef8" # any public subnet in any VPC, I am using default VPC subnet
#   hosted_zone = "nishalkdevops.online" # replace with your domain
#   hosted_zone_private = false

#   tags = {
#     Application = "Minikube"
#   }

#   addons = [
#     "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/storage-class.yaml",
#     "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/heapster.yaml",
#     "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/dashboard.yaml",
#     "https://raw.githubusercontent.com/scholzj/terraform-aws-minikube/master/addons/external-dns.yaml"
#   ]
# }