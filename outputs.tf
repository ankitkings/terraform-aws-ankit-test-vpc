output "vpc_id" {
  value = aws_vpc.main.id
}

locals {
  public_subnet_op = {
    for key, config in local.public_subnet : key => 
    {
        subnet_id = aws_subnet.main[key].id
        az = aws_subnet.main[key].availability_zone
    }
  }
  private_subnet_op = {
    for key, config in local.private_subnet : key => 
    {
        subnet_id = aws_subnet.main[key].id
        az = aws_subnet.main[key].availability_zone
    }
  }
}


output "public_subnet_ids" {
  value = local.public_subnet_op
}

output "private_subnet_ids" {
  value =  local.private_subnet_op
}