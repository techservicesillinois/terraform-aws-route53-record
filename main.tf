resource "aws_route53_record" "default" {
  zone_id = "${data.aws_route53_zone.selected.zone_id}"
  name    = "${var.hostname}"
  type    = "${var.type}"
  ttl     = "${var.ttl}"

  health_check_id = "${var.health_check_id}"

  records = ["${var.records}"]
}
