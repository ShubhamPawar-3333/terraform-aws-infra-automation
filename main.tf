terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-setupdemo"  # Replace with your bucket name
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks-setupdemo"           # For state locking
  }
}