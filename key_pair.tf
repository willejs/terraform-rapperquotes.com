resource "aws_key_pair" "default" {
  key_name   = "default" 
  public_key = "${file("${var.aws_ssh_key_file}.pub")}"
}