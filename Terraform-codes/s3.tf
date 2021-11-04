resource "aws_s3_bucket" "cortex_demo_s3" {
  bucket = "cortex-demo-main-storage"
  acl    = "private"
  
  lifecycle_rule {
    id      = "Cortex Data Retention Rule"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 365
    }
  }

  tags = var.global_tags
}

resource "aws_s3_bucket_public_access_block" "cortex_demo_s3_pub_access" {
  bucket	      = aws_s3_bucket.cortex_demo_s3.id

  block_public_acls   = true
  block_public_policy = true
}
