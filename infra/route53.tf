resource "aws_route53_zone" "aws_subdomain" {
  name = "aws.steveparson.ca"
}

output "name_servers" {
  description = "The NS records for the hosted zone"
  value       = aws_route53_zone.aws_subdomain.name_servers
}
