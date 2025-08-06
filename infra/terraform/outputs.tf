output "ci_user_access_key_id" {
  value       = aws_iam_access_key.ci_user_key.id
  sensitive   = true
  description = "Access key for GitHub Actions"
}

output "ci_user_secret_access_key" {
  value       = aws_iam_access_key.ci_user_key.secret
  sensitive   = true
  description = "Secret key for GitHub Actions"
}
