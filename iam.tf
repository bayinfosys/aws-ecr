data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ecr:GetAuthorizationToken",
    ]

    resources = ["*"]
  }

  statement {
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:GetRepositoryPolicy",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
      "ecr:BatchGetImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:PutImage",
    ]

    resources = [for r in aws_ecr_repository.default: r.arn]
  }
}

resource "aws_iam_policy" "default" {
  name        = "${var.project_name}-ecr-policy"
  description = "IAM to push ECR images"
  path        = "/"
  policy      = data.aws_iam_policy_document.default.json
}

resource "aws_iam_user" "default" {
  name = "${var.project_name}-ecr-pusher"
  force_destroy = true
  tags = var.tags
}

resource "aws_iam_user_policy" "default" {
  name_prefix = "${var.project_name}-ecr-pusher-policy"
  user = aws_iam_user.default.name
  policy = aws_iam_policy.default.policy
}  

resource "aws_iam_access_key" "default" {
  user    = aws_iam_user.default.name
}
