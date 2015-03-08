/* NAT Instance */
resource "aws_instance" "nat_a" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public_a.id}"
  security_groups = ["${aws_security_group.default-group.id}", "${aws_security_group.nat.id}"]
  key_name = "${aws_key_pair.default.key_name}"
  source_dest_check = false
  tags = { 
    Name = "nat-a"
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
      "sudo iptables -t nat -C POSTROUTING -o eth0 -s 10.128.0.0/16 -j MASQUERADE || sudo iptables -t nat -A POSTROUTING -o eth0 -s 10.128.0.0/16 -j MASQUERADE",
      "sudo sysctl -q -w net.ipv4.ip_forward=1 net.ipv4.conf.eth0.send_redirects=0",
      "sudo sysctl net.ipv4.ip_forward net.ipv4.conf.eth0.send_redirects"
    ]
  }
}
