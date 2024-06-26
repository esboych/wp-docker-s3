resource "aws_s3_bucket" "wordpress_media_bucket" {
  bucket = var.s3_bucket_name
  #acl    = "private"
}

resource "aws_s3_bucket_policy" "media_bucket_policy" {
  bucket = aws_s3_bucket.wordpress_media_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = "*",
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        Resource = "arn:aws:s3:::${aws_s3_bucket.wordpress_media_bucket.bucket}/*"
      },
      {
        Effect = "Allow",
        Principal = "*",
        Action = "s3:ListBucket",
        Resource = "arn:aws:s3:::${aws_s3_bucket.wordpress_media_bucket.bucket}"
      }
    ]
  })
}
