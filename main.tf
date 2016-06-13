variable "aws_subnet_id" {
  default = "subnet-99a58be2"
}

variable "aws_sec_id" {
  default = "sg-8e08dfe6"
}

variable "aws_ami" {
  default = "ami-74ee001b"
}

variable "aws_region" {
  default = "eu-central-1"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count = "3"
  ami = "${var.aws_ami}"
  instance_type = "t2.micro"
  subnet_id = "${var.aws_subnet_id}"
  vpc_security_group_ids = ["sg-8e08dfe6"]

  tags {
    Identity = "hashiconf-70efdf2ec9b086079795c442636b55fb"
    test = "somevalue"
    anothervar = "foo"
  }
}

output "public_dns" {
    value = "${join(", ", aws_instance.web.*.public_dns)}"
}

output "public_ip" {
    value = "${join(", ", aws_instance.web.*.public_ip)}"
}
