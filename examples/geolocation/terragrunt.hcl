include {
  path = "${find_in_parent_folders()}"
}

terraform {
  source = "git@github.com:techservicesillinois/terraform-aws-route53-record"
}

inputs = {
  hostname = "test"
  domain   = "courses.illinois.edu"
  type     = "A"
  ttl      = 5

  set_identifier = "geolocation"

  geolocation_routing_policy = {
    continent = "NA" # North America
  }

  records = [
    "192.168.1.128",
  ]
}
