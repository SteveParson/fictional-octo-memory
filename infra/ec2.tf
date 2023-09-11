# data "aws_ami" "al2" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"]
# }

# resource "aws_instance" "my_instance" {
#   ami                    = data.aws_ami.al2.id
#   instance_type          = "t2.micro"
#   key_name               = aws_key_pair.my_key.key_name
#   vpc_security_group_ids = [aws_security_group.my_sg.id]
# }

# resource "aws_key_pair" "my_key" {
#   key_name   = "my_key"
#   public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMgFNu57lUI2qx6CuvacTtW4xgdeGwJxLrz6tdHUtU8B me@steveparson.ca"
# }

# resource "aws_security_group" "my_sg" {
#   name        = "my_sg"
#   description = "My security group"

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["174.116.163.24/32"]
#   }

#   ingress {
#     from_port   = 51820
#     to_port     = 51820
#     protocol    = "udp"
#     cidr_blocks = ["174.116.163.24/32"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# output "instance_public_ip" {
#   description = "The public IP of the launched instance"
#   value       = aws_instance.my_instance.public_ip
# }

# resource "aws_route53_zone" "aws_subdomain" {
#   name = "aws.steveparson.ca"
# }
# output "name_servers" {
#   description = "The NS records for the hosted zone"
#   value       = aws_route53_zone.aws_subdomain.name_servers
# }

# resource "aws_route53_record" "ec2_instance_a_record" {
#   zone_id = aws_route53_zone.aws_subdomain.zone_id
#   name    = "proxy.aws.steveparson.ca"
#   type    = "A"
#   ttl     = "300"
#   records = [aws_instance.my_instance.public_ip]
# }

# output "aws_subdomain_ns" {
#   value       = aws_route53_zone.aws_subdomain.name_servers
#   description = "The name servers for the aws.steveparson.ca subdomain."
# }
