
# defaults

variable "defaults_vcl_recv_condition" {}
variable "defaults_backend_name" {}
variable "defaults_backend_host" {}

module "defaults" {
  source = "../.."
  vcl_recv_condition = "${var.defaults_vcl_recv_condition}"
  backend_name = "${var.defaults_backend_name}"
  backend_host = "${var.defaults_backend_host}"
}

output "defaults_vcl_recv" {
  value = "${module.defaults.vcl_recv}"
}

output "defaults_backend" {
  value = "${module.defaults.backend}"
}

# ssl_ca_cert

variable "ssl_ca_cert" {}

module "ssl_ca_cert" {
  source = "../.."
  vcl_recv_condition = "dummy-vcl-recv-condition"
  backend_name = "dummy-backend"
  backend_host = "dummy-host"
  ssl_ca_cert  = "${var.ssl_ca_cert}"
}

output "ssl_ca_cert_backend" {
  value = "${module.ssl_ca_cert.backend}"
}

# ssl_check_cert never

variable "ssl_check_cert" {}

module "ssl_check_cert" {
  source = "../.."
  vcl_recv_condition = "dummy-vcl-recv-condition"
  backend_name = "dummy-backend"
  backend_host = "dummy-host"
  ssl_check_cert  = "${var.ssl_check_cert}"
}

output "ssl_check_cert_backend" {
  value = "${module.ssl_check_cert.backend}"
}

