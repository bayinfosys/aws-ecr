output "pusher_access_key_id" {
  value = aws_iam_access_key.default.id
}

output "pusher_access_key_secret" {
  value = aws_iam_access_key.default.secret
}

output "containers" {
  value = aws_ecr_repository.default
}
