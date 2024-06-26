resource "aws_ecr_repository" "wordpress" {
  name                 = "raketech"
  image_tag_mutability = "MUTABLE"

}

output "ecr_repository_url" {
  value = aws_ecr_repository.wordpress.repository_url
}
