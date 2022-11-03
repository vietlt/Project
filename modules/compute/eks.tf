resource "aws_eks_cluster" "eks-cluster" {
  name     = "eks"
  role_arn = aws_iam_role.eks-cluster.arn
  vpc_config {
    subnet_ids         = [data.aws_subnet.private_subnet_1.id, data.aws_subnet.private_subnet_3.id, data.aws_subnet.public_subnet_1.id, data.aws_subnet.public_subnet_2.id]
    security_group_ids = [data.aws_security_group.nodes_sg.id]
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
  ]
}

resource "aws_eks_node_group" "eks-node" {
  node_group_name = "node-woker"
  cluster_name    = aws_eks_cluster.eks-cluster.name
  node_role_arn   = aws_iam_role.eks-node.arn
  subnet_ids      = [data.aws_subnet.private_subnet_1.id, data.aws_subnet.private_subnet_3.id]
  instance_types  = var.instance_types
  capacity_type   = "ON_DEMAND"
  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }
  update_config {
    max_unavailable = 1
  }
  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
  ]
}
