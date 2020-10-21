data "aws_vpc" "aws_vpc" {
    id = var.vpc_id
}

data "aws_subnet_ids" "subnet_ids" {
    vpc_id = data.aws_vpc.subnet_ids.id
}

data "aws_security_groups" "security_groups" {
    filter {
        name = "group-name"
        values = ["wordpress"]
    }

    filter {
        name = "vpc-id"
        values = [data.aws_vpc.aws_vpc.id]
    }
}
