module "ecr" {
  source = "../"

  project_name = var.project_name
  tags = merge(var.project_tags)

  containers = {
    "custom-nginx" = { image_tag = "v0.3" }
    "corporate/team/name" = { image_tag = "latest" }
  }
}
