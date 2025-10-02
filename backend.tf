terraform {
  backend "s3" {
    bucket = "veera65"  
    key    = "terraform.tfstate"        
    region = "us-east-1"                       
  }
}
