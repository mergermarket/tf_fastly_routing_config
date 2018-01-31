variable "vcl_recv_condition" {
  description = "boolean condition to use to select the backend in vcl_recv"
  type        = "string"
}

variable "backend_name" {
  description = "Identifier for the backend/"
  type        = "string"
}

variable "connect_timeout" {
  description = ""
  type        = "string"
  default     = "5s"
}

variable "dynamic" {
  description = ""
  type        = "string"
  default     = "true"
}

variable "first_byte_timeout" {
  description = ""
  type        = "string"
  default     = "20s"
}

variable "between_bytes_timeout" {
  description = ""
  type        = "string"
  default     = "20s"
}

variable "max_connections" {
  description = ""
  type        = "string"
  default     = "1000"
}

variable "backend_port" {
  description = ""
  type        = "string"
  default     = "443"
}

variable "backend_host" {
  description = ""
  type        = "string"
}

variable "ssl_ca_cert" {
  description = "SSL CA certificate in PEM format to validate the backend cert against"
  default     = ""
}

variable "ssl_check_cert" {
  description = "Whether to validate the backend SSL cert - must be \"always\" - the default and recommended value, or \"never\", which should be considered a security risk"
  default     = "always"
}

variable "probe_enabled" {
  description = "Whether the backend should be probed."
  type        = "string"
  default     = "false"
}

variable "probe_threshold" {
  description = "Along with the probe_window, the number of successes per total number health checks. For example, specifying 1/2 means 1 out of 2 checks must pass to be reported as healthy."
  type        = "string"
  default     = "1"
}

variable "probe_window" {
  description = "See the description for probe_threshold above. Default is based on Fastly's \"Low\" option - see https://docs.fastly.com/guides/basic-configuration/health-check-frequency."
  type        = "string"
  default     = "2"
}

variable "probe_initial" {
  description = "The number of requests to assume as passing on deploy. Default is based on Fastly's \"Low\" option - see https://docs.fastly.com/guides/basic-configuration/health-check-frequency."
  type        = "string"
  default     = "1"
}

variable "probe_interval" {
  description = "The period of time for the requests to run. Default is based on Fastly's \"Low\" option - see https://docs.fastly.com/guides/basic-configuration/health-check-frequency."
  type        = "string"
  default     = "60s"
}

variable "probe_timeout" {
  description = "The wait time until request is considered failed. Default is based on Fastly's \"Low\" option - see https://docs.fastly.com/guides/basic-configuration/health-check-frequency."
  type        = "string"
  default     = "5s"
}

variable "healthcheck_path" {
  description = "Path to visit on your origins when performing the check."
  type        = "string"
  default     = "/internal/healthcheck"
}
