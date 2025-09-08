resource "aws_eip" "nat" {
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
}

# One association per private subnet
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_ids)
  subnet_id      = var.private_subnet_ids[count.index]
  route_table_id = aws_route_table.private.id
}