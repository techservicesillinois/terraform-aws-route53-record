resource "aws_route53_record" "default" {
  zone_id = data.aws_route53_zone.selected.zone_id
  name    = var.hostname
  type    = var.type
  ttl     = var.ttl

  set_identifier  = var.set_identifier
  health_check_id = var.health_check_id

  dynamic "failover_routing_policy" {
    for_each = toset(var.failover_routing_policy != null ? [var.failover_routing_policy] : [])

    content {
      type = failover_routing_policy.value["type"]
    }
  }

  records = var.records
}
