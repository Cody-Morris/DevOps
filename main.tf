terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.45.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
  # Configuration options
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}


resource "azurerm_resource_group" "example" {
  name     = "${var.rgname}-${count.index}"
  count    = var.numberofrg 
  location = "West Europe"
}

variable "numberofrg" {
    default = 2
}

variable "rgname" {
    default = "azurerm_resource_group"
}

resource "aws_iam_user" "new_users" {
  for_each = toset(var.new_users)
  name = each.value
}

variable "new_users" {
  default = ["user1", "user2", "user3"]
}
