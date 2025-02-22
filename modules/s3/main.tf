resource "aws_s3_bucket" "terraform_state" {
  bucket = "manikanta-terraform-state-bucket"
}

resource "aws_s3_bucket_acl" "terraform_state_acl" {
  bucket = aws_s3_bucket.terraform_state.id
  acl    = "private"
}
