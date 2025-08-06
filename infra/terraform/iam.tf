resource "aws_iam_user" "github_ci_user" {
  name = "${var.project_name}-ci-user"
}

resource "aws_iam_policy" "ecr_policy" {
  name = "${var.project_name}-ecr-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:PutImage",
          "ecr:InitiateLayerUpload",
          "ecr:UploadLayerPart",
          "ecr:CompleteLayerUpload",
          "ecr:DescribeRepositories",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_policy" {
  user       = aws_iam_user.github_ci_user.name
  policy_arn = aws_iam_policy.ecr_policy.arn
}

resource "aws_iam_access_key" "ci_user_key" {
  user = aws_iam_user.github_ci_user.name
}
