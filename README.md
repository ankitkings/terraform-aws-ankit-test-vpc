# terraform aws_vpc

## Overview

This terraform  module creates an AWS VPC  with the given CIDR  block. It also creates  multiple subnets( public, private), and for public subnets, it set us an  Internet Gateway (IGw) and route tables.

## Features

- Create a VPC with a specified  CIDR block.
- Creates  public subnet and private subnets.
- Creates an Internet Gateway(IGw) for public subnet.
- Sets up route tables for public subnets

## Usage

```
module "vpc" {
  source = "./module/VPC"
  
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "Your VPC Name"
  }

  subnet_config = {
    public_subnet = {
      cidr_block        = "10.0.0.0/24"
      availability_zone = "ap-south-1a"
      # To set subnet as a public, default is private
      public            = true
    }

    private_subnet = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "ap-south-1b"
    }
  }
}
```