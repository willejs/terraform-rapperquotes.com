/* NAT Instance */
resource "aws_instance" "nat_a" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public_a.id}"
  security_groups = ["${aws_security_group.default-group.id}"]
  key_name = "${aws_key_pair.default.key_name}"
  source_dest_check = false
  tags = { 
    Name = "nat_a"
  }
  connection {
    user = "ubuntu"
    /* "LEAVEEEE IT YEAAAAAAH" Leathan Bizzle, Home Video */ 
    key_file = "${var.aws_ssh_key_file}"
  }
  provisioner "remote-exec" {
    inline = [
      /* Should be in Chef */
      /* "They yellin' Chef" The morning - Raekwon */
      "sudo iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -j MASQUERADE",
      "echo 1 | sudo tee /proc/sys/net/ipv4/conf/all/forwarding"
    ]
  }
}
