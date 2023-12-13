terraform {
  cloud {
    organization = "Ayodev"

    workspaces {
      name = "Auto-Terraform-Deployment-new"
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

