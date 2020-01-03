# AWS Provider
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "gage-instance" {
  count         = 1
  ami           = "ami-0f65671a86f061fcd"
  instance_type = "t2.micro"
  key_name      = "aws-mignin"
}

output "instance_ips" {
  value = ["${aws_instance.gage-instance.*.public_ip}"]
}
