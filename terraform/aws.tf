provider "aws" {}

resource "aws_instance" "quik_vpn" {
    ami = "${var.ami}"
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.quik_vpn.name}"]
}

