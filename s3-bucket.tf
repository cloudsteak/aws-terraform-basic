resource "aws_s3_bucket" "iac_public_bucket" {
  bucket = var.s3_iac_bucket_name
}

resource "aws_s3_bucket_public_access_block" "iac_public_bucket_access_block" {
  bucket = aws_s3_bucket.iac_public_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "iac_public_bucket_bucket_policy" {
  bucket = aws_s3_bucket.iac_public_bucket.id
  policy = data.aws_iam_policy_document.allow_get_object.json
}

data "aws_iam_policy_document" "allow_get_object" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions = ["s3:GetObject"]

    resources = [
      "${aws_s3_bucket.iac_public_bucket.arn}/*",
      aws_s3_bucket.iac_public_bucket.arn
    ]
  }
}

