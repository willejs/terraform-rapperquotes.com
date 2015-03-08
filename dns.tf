resource "aws_route53_zone" "primary" {
   name = "rapperquotes.net"
}

resource "aws_route53_record" "www" {
   zone_id = "${aws_route53_zone.primary.zone_id}"
   name = "www.example.com"
   type = "CNAME"
   ttl = "300"
   records = ["${aws_elb.app.dns_name}"]
}