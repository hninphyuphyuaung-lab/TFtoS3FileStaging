##Create S3 Bucket
resource "aws_s3_bucket" "tf_hppa_state" {
  bucket = "tf-hppa-state-bucket"
}

##Enable S3 Bucket Versioning
resource "aws_s3_bucket_versioning" "tf_hppa_bucket_versioning" {
  bucket = aws_s3_bucket.tf_hppa_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

##Create DynamoDB
resource "aws_dynamodb_table" "tf-hppa-dynamodb-table" {
  name           = "tf-hppa-state-dynamodb"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}