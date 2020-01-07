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

  dynamic "geolocation_routing_policy" {
    for_each = toset(var.geolocation_routing_policy != null ? [var.geolocation_routing_policy] : [])

    content {
      continent   = lookup(geolocation_routing_policy.value, "continent", null)
      country     = lookup(geolocation_routing_policy.value, "country", null)
      subdivision = lookup(geolocation_routing_policy.value, "subdivision", null)
    }
  }

  records = var.records
}
