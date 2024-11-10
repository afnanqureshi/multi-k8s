resource "aws_eks_cluster" "devops" {
  name     = "devops"
  role_arn = aws_iam_role.eks_cluster_role.arn
  vpc_config {
    subnet_ids = aws_subnet.eks_subnet.*.id
  }
}

resource "aws_eks_node_group" "devops_nodes" {
  cluster_name    = aws_eks_cluster.devops.name
  node_group_name = "devops-nodes"
  node_role_arn   = aws_iam_role.eks_node_group_role.arn
  subnet_ids      = aws_subnet.eks_subnet.*.id

  scaling_config {
    desired_size = 1
    min_size     = 0
    max_size     = 2
  }

  instance_type = "t2.micro"
}