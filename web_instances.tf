/* web servers - to be replaces with asg */
resource "aws_instance" "web" {
  count = 1
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.private_a.id}"
  security_groups = ["${aws_security_group.default-group.id}", "${aws_security_group.web.id}"]
  key_name = "${aws_key_pair.default.key_name}"
  source_dest_check = false
  tags = { 
    Name = "web-${count.index}"
  }
}

/* Load balancer */
resource "aws_elb" "app" {
  name = "web-elb"
  subnets = ["${aws_subnet.public_a.id}", "${aws_subnet.public_b.id}", "${aws_subnet.public_d.id}", "${aws_subnet.public_e.id}"]
  security_groups = ["${aws_security_group.default-group.id}", "${aws_security_group.web.id}"]
  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }
  instances = ["${aws_instance.web.*.id}"]
}
