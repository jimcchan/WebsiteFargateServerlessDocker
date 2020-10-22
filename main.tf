locals {
    application_name = "tf-fargate-intro"
    launch_type = "FARGATE"
}

resource "aws_ecs_cluster" "ecs_cluster" {
    name = local.application_name
}

resource "aws_ecs_service" "ecs_service" {
    name = "wordpress"
    cluster = aws_ecs_cluster.ecs_service.arn
    launch_type = local.launch_type
    
    deployment_maximum_percent = 200
    deployment_minimum_healthy_percent = 0
    desired_count = 1
    task_definition = "aws_ecs_task_definition.ecs_task_definition.family}:${aws_ecs_task_definition.this.revision"
    
    network_configuration {
        assign_public_ip = true
        security_groups = data.aws_security_groups.security_groups.ids
        subnets = data.aws_subnet_ids.subnet_ids.ids
    }
}
