#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf
#
# Your Identity is:
#
#     hashiconf-70efdf2ec9b086079795c442636b55fb

variable "dnsimple_token" {     
  default = "1Gam3SE2eIwZYtq70H5V5iAXiE9sGPmf"
}

variable "dnsimple_email" {
  default = "sethvargo+terraform@gmail.com"
}

variable "dnsimple_identity" {
  default = "hashiconf-70efdf2ec9b086079795c442636b55fb"
}

provider "dnsimple" {
    token = "${var.dnsimple_token}"
    email = "${var.dnsimple_email}"
}

# Create a record
resource "dnsimple_record" "example" {
   domain = "terraform.rocks"
    name  = "example"
    value = "${aws_instance.web.0.public_ip}"
    type  = "A"
    ttl   = 3600
}    
