output "ecr_arn" {
  value       = aws_ecr_repository.litecoin.arn
  description = "arn of ECR repo"
}

output "ecr_url" {
  value       = aws_ecr_repository.litecoin.repository_url
  description = "url of ecr repo"
}