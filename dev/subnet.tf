resource "aws_subnet" "eks_subnet" {
  count                   = 2
  vpc_id                 = aws_vpc.eks_vpc.id
  cidr_block             = "10.0.0.0/24"
  availability_zone      = element(["us-east-1a", "us-east-1b"], count.index)
  map_public_ip_on_launch = true
}