terraform {
  cloud {
    organization = "Ayodev"

    workspaces {
      name = ""
    }
  }
}

provider "aws" {
  region = "us-west-1"
}

