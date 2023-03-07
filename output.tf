output "region" {
    value = var.region
}

output "project_name" {
    value = var.project_name
}

output "vpv_id" {
    value = aws_vpc.vpc.id
}

output "public_subnet_emy1_id" {
    value = aws_subnet.public_subnet_emy1.id
}

output "public_subnet__emy2_id" {
    value = aws_subnet.public_subnet_emy2.id
}

output "private_app_subnet_emy1_id" {
    value = aws_subnet.private_app_subnet_emy1.id
}

output "private_app_subnet__emy2_id" {
    value = aws_subnet.private_app_subnet_emy2.id
}


output "aws_internet_gateway" {
    value = aws_internet_gateway.internet_gateway
}