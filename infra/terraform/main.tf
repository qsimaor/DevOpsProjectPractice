provider "aws" {
  region = "eu-west-1"
}

resource "aws_ecr_repository" "flask_app_repo" {
  name                 = "flask-devops-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
