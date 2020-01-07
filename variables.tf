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

variable "health_check_id" {
  description = "The health check the record should be associated with."
  default     = ""
}
