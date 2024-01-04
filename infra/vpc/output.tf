output "vpc" {
  value = {
    id         = aws_vpc.vpc.id
    arn        = aws_vpc.vpc.arn
    cidr_block = aws_vpc.vpc.cidr_block
  }
}

output "public-subnet-1" {
  value = {
    id              = aws_subnet.public-subnet-1.id
    arn             = aws_subnet.public-subnet-1.arn
    cidr_block      = aws_subnet.public-subnet-1.cidr_block
    route_table_arn = aws_route_table.public-subnet-route-table.arn
  }
}

output "public-subnet-2" {
  value = {
    id              = aws_subnet.public-subnet-2.id
    arn             = aws_subnet.public-subnet-2.arn
    cidr_block      = aws_subnet.public-subnet-2.cidr_block
    route_table_arn = aws_route_table.public-subnet-route-table.arn
  }
}

output "private-subnet-1" {
  value = {
    id              = aws_subnet.private-subnet-1.id
    arn             = aws_subnet.private-subnet-1.arn
    cidr_block      = aws_subnet.private-subnet-1.cidr_block
    route_table_arn = aws_route_table.private-subnet-1-route-table.arn
  }
}

output "private-subnet-2" {
  value = {
    id              = aws_subnet.private-subnet-2.id
    arn             = aws_subnet.private-subnet-2.arn
    cidr_block      = aws_subnet.private-subnet-2.cidr_block
    route_table_arn = aws_route_table.private-subnet-2-route-table.arn
  }
}


output "internet-gateway" {
  value = {
    id  = aws_internet_gateway.internet-gateway.id
    arn = aws_internet_gateway.internet-gateway.arn
  }
}