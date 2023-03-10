# configure aws provider
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATFA3AB5D6HHYW74N"
  secret_key = "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"
}


# create vpc
module "vpc" {
    source                           = "../modules/vpc/"
   region                            = var.region
   project_name                      = var.project_name
   vpc_cidr                          = var.vpc_cidr
   public_subnet_emy1_cidr           = var.public_subnet_emy1_cidr
   public_subnet_emy2_cidr           = var.public_subnet_emy2_cidr
   private_app_subnet_emy1_cidr      = var.private_app_subnet_emy1_cidr
   private_app_subnet_emy2_cidr      = var.private_app_subnet_emy2_cidr
}