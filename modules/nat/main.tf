resource "aws_eip" "nat" {
  domain = "vpc"
  tags = { Name = "${var.env}-nat-eip" }
}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.nat.id
  subnet_id     = element(var.public_subnet_ids, 0)
  tags          = { Name = "${var.env}-nat" }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id
  tags   = { Name = "${var.env}-private-rt" }
}

# Default route out through NAT
resource "aws_route" "private_default" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.this.id
  depends_on = [aws_nat_gateway.this]
}

# One association per private subnet
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private.id
}

resource "aws_internet_gateway" "this" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env}-public-rt"
  }
}

resource "aws_route" "public_default" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_ids)
  subnet_id      = var.public_subnet_ids[count.index]
  route_table_id = aws_route_table.public.id
}
