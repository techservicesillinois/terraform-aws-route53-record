include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source = "git@github.com:techservicesillinois/terraform-aws-route53-record?ref=v3.0.0"
}

inputs = {
  hostname = "test"
  domain = "courses.illinois.edu"
  type   = "A"
  ttl    = 5

  set_identifier = "failover"

  failover_routing_policy = {
    type = "SECONDARY"
  }
  
  records = [
      "192.168.1.64",
  ]
}
