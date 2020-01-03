variable "domain" {
  description = "Hosted zone in which to create Route53 record."
}

variable "hostname" {
  description = "Hostname for Route53 record."
  default     = ""
}

variable "type" {
  description = "The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
}

variable "ttl" {
  description = "The TTL of the record."
  default     = 60
}

variable "records" {
  description = "A string list of records."
  type        = list(string)
}

variable "set_identifier" {
  description = "Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below."
  type        = string
  default     = null
}

variable "health_check_id" {
  description = "The health check the record should be associated with."
  type        = string
  default     = null
}

variable "failover_routing_policy" {
  description = "A block indicating the routing behavior when associated health check fails. Conflicts with any other routing policy."
  type        = map(any)
  default     = null
}
