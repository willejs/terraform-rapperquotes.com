resource "aws_route53_zone" "primary" {
   name = "rapperquotes.net"
}

resource "aws_route53_record" "www" {
   zone_id = "${aws_route53_zone.primary.zone_id}"
   name = "www.rapperquotes.net"
   type = "CNAME"
   ttl = "10"
   records = ["${aws_elb.app.dns_name}"]
}