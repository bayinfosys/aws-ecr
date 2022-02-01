resource "aws_ecr_repository" "default" {
  for_each = var.containers

  name = "${var.project_name}/${each.key}"

  tags = merge(var.tags)
}

#data "aws_ecr_image" "default" {
#  for_each = var.containers
#
#  repository_name = aws_ecr_repository.default[each.key].name
#  image_tag       = each.value.image_tag
#}

resource "aws_ecr_lifecycle_policy" "default" {
  for_each = var.containers

  repository = aws_ecr_repository.default[each.key].name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last ${var.max_repository_image_count} images",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": ${var.max_repository_image_count}
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}
