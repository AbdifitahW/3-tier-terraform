provider "aws" {
  region = "us-east-1" 
}

resource "aws_s3_bucket" "bucket" {
  bucket = "tf-test-bucket-abdifitah"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [ aws_s3_bucket_ownership_controls.bucket_owner_controls ]
  bucket = aws_s3_bucket.bucket.id
  acl = "private" 
}

resource "aws_s3_bucket_ownership_controls" "bucket_owner_controls" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
resource "aws_s3_object" "folder" {
  bucket = aws_s3_bucket.bucket.id
  key = "uploads"
  
}
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}