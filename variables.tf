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

variable "probe_window" {
  description = ""
  type        = "string"
  default     = "5"
}

variable "probe_threshold" {
  description = ""
  type        = "string"
  default     = "1"
}

variable "probe_timeout" {
  description = ""
  type        = "string"
  default     = "2s"
}

variable "probe_initial" {
  description = ""
  type        = "string"
  default     = "5"
}
