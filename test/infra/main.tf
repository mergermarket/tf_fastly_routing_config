
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

output "defaults_vcl_backend" {
  value = "${module.defaults.vcl_backend}"
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

output "ssl_ca_cert_vcl_backend" {
  value = "${module.ssl_ca_cert.vcl_backend}"
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

output "ssl_check_cert_vcl_backend" {
  value = "${module.ssl_check_cert.vcl_backend}"
}

# ssl_sni_hostname

variable "ssl_sni_hostname" {}

module "ssl_sni_hostname" {
  source = "../.."
  vcl_recv_condition = "dummy-vcl-recv-condition"
  backend_name = "dummy-backend"
  backend_host = "dummy-host"
  ssl_sni_hostname  = "${var.ssl_sni_hostname}"
}

output "ssl_sni_hostname_vcl_backend" {
  value = "${module.ssl_sni_hostname.vcl_backend}"
}
