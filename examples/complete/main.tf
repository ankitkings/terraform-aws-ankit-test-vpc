module "vpc" {
  source = "./module/VPC"
  
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-root-vpc"
  }

  subnet_config = {
    public_subnet = {
      cidr_block        = "10.0.0.0/24"
      availability_zone = "ap-south-1a"
      public            = true
    }

    private_subnet = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "ap-south-1b"
    }
  }
}