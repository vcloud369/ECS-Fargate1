terraform {
  backend "s3" {
    bucket = "manikanta-terraform-state-bucket"  
    key    = "path/to/terraform.tfstate"        
    region = "ap-south-1"                       
    dynamodb_table = "terraform-state-lock"     
  }
}
