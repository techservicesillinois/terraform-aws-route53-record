# route53-record

[![Terraform actions status](https://github.com/techservicesillinois/terraform-aws-route53-record/workflows/terraform/badge.svg)](https://github.com/techservicesillinois/terraform-aws-route53-record/actions)

Provides a Route53 [record](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html) resource.

Example Usage
-----------------

Create an A record for `foo.com` in zone `foo.com`

```
module "service_name" {
  source = "git@github.com:techservicesillinois/terraform-aws-route53-record"

  domain   = "foo.com"
  type     = "A"

    records = [
        "192.168.0.1",
    ]
}
```

Create an A record for `www.foo.com` in zone `foo.com`

```
module "service_name" {
  source = "git@github.com:techservicesillinois/terraform-aws-route53-record"

  hostname = "www"
  domain   = "foo.com"
  type     = "A"

    records = [
        "192.168.0.1",
    ]
}
```

Create a CNAME record for `www.foo.com` pointing to `www.bar.com`

```
module "service_name" {
  source = "git@github.com:techservicesillinois/terraform-aws-route53-record"

  hostname = "www"
  domain   = "foo.com"
  type     = "CNAME"

    records = [
        "www.bar.com",
    ]
}
```

Argument Reference
-----------------

The following arguments are supported:

* `domain` - (Required) Hosted zone in which to create Route53 record.

* `hostname` - (Optional) Hostname for Route53 record.

* `type` - (Required) The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT.

* `records` - (Required) A string list of records.

* `ttl` - (Optional) The TTL of the record (default 60).

* `health_check_id` - (Optional) The health check the record should be associated with.

Attributes Reference
--------------------

The following attributes are exported:

* `fqdn` - [FQDN](https://en.wikipedia.org/wiki/Fully_qualified_domain_name) built using the zone domain and hostname.

Limitations
-----------

* Does not support [alias records](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/resource-record-sets-choosing-alias-non-alias.html).

* Does not support the following blocks:

    * latency_routing_policy
    * weighted_routing_policy

* Does not support the following arguments:

    * set_identifier
    * multivalue_answer_routing_policy
    * allow_overwrite

Credits
--------------------

**Nota bene:** The vast majority of the verbiage on this page was
taken directly from the Terraform [manual](https://www.terraform.io/docs/providers/aws/r/route53_record.html), and in a few cases from
Amazon's documentation.
