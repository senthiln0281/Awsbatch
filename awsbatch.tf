provider "aws"{
  region = "us-west-2"
}
resource "aws_batch_job_queue" "asgen_queue" {
  name = "tf-test-batch-job-queue"
  state = "ENABLED"
  priority = 1
  compute_environments = ["${aws_batch_compute_environment.asgen.arn}","${aws_batch_compute_environment.asgen1.arn}"]
}
resource "aws_iam_role" "ecs_instance_role" {
  name = "ecs_instance_role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
        "Service": "ec2.amazonaws.com"
        }
    }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ecs_instance_role" {
  role       = "${aws_iam_role.ecs_instance_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_instance_profile" "ecs_instance_role" {
  name  = "ecs_instance_role"
  role = "${aws_iam_role.ecs_instance_role.name}"
}

resource "aws_iam_role" "aws_batch_service_role" {
  name = "aws_batch_service_role"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Action": "sts:AssumeRole",
        "Effect": "Allow",
        "Principal": {
        "Service": "batch.amazonaws.com"
        }
    }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "aws_batch_service_role" {
  role       = "${aws_iam_role.aws_batch_service_role.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBatchServiceRole"
}

resource "aws_security_group" "asgen" {
  name = "aws_batch_compute_environment_security_group"
}

resource "aws_vpc" "default" {
  cidr_block = "172.31.0.0/16"
}

resource "aws_subnet" "Pub_Sub" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "172.31.16.0/20"
}

resource "aws_batch_compute_environment" "asgen" {
  compute_environment_name = "asgen"
  compute_resources {
    instance_role = "${aws_iam_instance_profile.ecs_instance_role.arn}"
    instance_type = [
      "t2.micro",
    ]
    max_vcpus = 2
    min_vcpus = 0
    security_group_ids = [
      "${aws_security_group.asgen.id}"
    ]
    subnets = [
      "${aws_subnet.Pub_Sub.id}"
    ]
    type = "EC2"
  }
  service_role = "${aws_iam_role.aws_batch_service_role.arn}"
  type = "MANAGED"
  depends_on = ["aws_iam_role_policy_attachment.aws_batch_service_role"]
}
resource "aws_batch_job_definition" "asgen" {
    name = "tf_test_batch_job_definition"
    type = "container"
    container_properties = <<CONTAINER_PROPERTIES
{
    "command": ["ls", "-la"],
    "image": "busybox",
    "memory": 1024,
    "vcpus": 1,
    "volumes": [
      {
        "host": {
          "sourcePath": "/tmp"
        },
        "name": "tmp"
      }
    ],
    "environment": [
        {"name": "VARNAME", "value": "VARVAL"}
    ],
    "mountPoints": [
        {
          "sourceVolume": "tmp",
          "containerPath": "/tmp",
          "readOnly": false
        }
    ],
    "ulimits": [
      {
        "hardLimit": 1024,
        "name": "nofile",
        "softLimit": 1024
      }
    ]
}
CONTAINER_PROPERTIES
}