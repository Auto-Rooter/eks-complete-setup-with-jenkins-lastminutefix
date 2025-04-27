output "cluster_id" {
    value = aws_eks_cluster.lastminutefix.id
}

output "node_group_id" {
    value = aws_eks_node_group.lastminutefix.id
}

output "vpc_id" {
    value = aws_vpc.lastminutefix_vpc.id
}

output "subnet_ids" {
    value = aws_subnet.lastminutefix_subnet[*].id
}