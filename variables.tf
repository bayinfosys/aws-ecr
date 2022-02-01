variable "project_name" { type = string }

variable "containers" {
  type = map(object({
    image_tag = string
  }))

  description = "key value pairs of repository name and image tag"
}

variable "max_repository_image_count" {
  type = number
  default = 12
  description = "maximum number of images to retain in the repositories"
}

variable "tags" { type = map(string) }
