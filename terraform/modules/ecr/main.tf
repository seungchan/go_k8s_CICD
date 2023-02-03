resource "aws_ecr_repository" "ecr" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = var.tags
}
