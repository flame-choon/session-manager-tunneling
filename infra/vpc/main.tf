###########################
# VPC
###########################
resource "aws_vpc" "vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "vpc"]))}"
  })
}

###########################
# SUBNET
###########################
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "public", "subnet", "1"]))}"
  })
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "ap-northeast-2b"
  map_public_ip_on_launch = true

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "public", "subnet", "2"]))}"
  })
}


resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.128.0/20"
  availability_zone = "ap-northeast-2a"

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "private", "subnet", "1"]))}"
  })
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.144.0/20"
  availability_zone = "ap-northeast-2b"

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "private", "subnet", "2"]))}"
  })
}


###########################
# INTERNET GATEWAY
###########################
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "internet", "gateway"]))}"
  })
}


###########################
# Route Table
###########################
resource "aws_route_table" "public-subnet-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  route {
    cidr_block = aws_vpc.vpc.cidr_block
    gateway_id = "local"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "public", "subnet", "route", "table"]))}"
  })
}


resource "aws_route_table" "private-subnet-1-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = aws_vpc.vpc.cidr_block
    gateway_id = "local"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "private", "subnet", "1", "route", "table"]))}"
  })
}

resource "aws_route_table" "private-subnet-2-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = aws_vpc.vpc.cidr_block
    gateway_id = "local"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "private", "subnet", "2", "route", "table"]))}"
  })
}

resource "aws_route_table" "private-subnet-3-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = aws_vpc.vpc.cidr_block
    gateway_id = "local"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "private", "subnet", "3", "route", "table"]))}"
  })
}

resource "aws_route_table" "private-subnet-4-route-table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = aws_vpc.vpc.cidr_block
    gateway_id = "local"
  }

  tags = merge(local.default_tags, {
    Name = "${join("-", compact([local.name_prefix, "private", "subnet", "4", "route", "table"]))}"
  })
}

resource "aws_route_table_association" "public-subnet-routing-1" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-subnet-route-table.id
}

resource "aws_route_table_association" "public-subnet-routing-2" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-subnet-route-table.id
}

resource "aws_route_table_association" "private-subnet-routing-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-subnet-1-route-table.id
}

resource "aws_route_table_association" "private-subnet-routing-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-subnet-2-route-table.id
}