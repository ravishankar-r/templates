resource "aws_instance" "testec2" {
  ami           = "ami-028f2b5ee08012131"
  instance_type = var.instance_type
}
