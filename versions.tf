terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.67.0"
    }
  }
  
   backend "s3" {
    bucket  = "tf-hppa-state-bucket"
    dynamodb_table = "tf-hppa-state-dynamodb"
    key     = "tfStateFiles"
    region  = "ap-southeast-1"
    profile = "hppa-tf-admin-role"
  }
}

##Configure AWS
provider "aws" {
  shared_config_files      = ["/Users/hninphyuphyuaung/.aws/config"]
  shared_credentials_files = ["/Users/hninphyuphyuaung/.aws/credentials"]
  profile                  = "hppa-tf-admin-role"
}