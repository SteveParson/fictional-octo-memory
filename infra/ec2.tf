#data "aws_ami" "al2" {
#  most_recent = true
#
#  filter {
#    name   = "name"
#    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#  }
#
#  filter {
#    name   = "virtualization-type"
#    values = ["hvm"]
#  }
#
#  owners = ["099720109477"]
#}
#
#resource "aws_instance" "my_instance" {
#  ami                    = data.aws_ami.al2.id
#  instance_type          = "t2.micro"
#  key_name               = aws_key_pair.my_key.key_name
#  vpc_security_group_ids = [aws_security_group.my_sg.id]
#}
#
#resource "aws_route53_record" "ec2_instance_a_record" {
#  zone_id = aws_route53_zone.aws_subdomain.zone_id
#  name    = "proxy.aws.steveparson.ca"
#  type    = "A"
#  ttl     = "300"
#  records = [aws_instance.my_instance.public_ip]
#}
