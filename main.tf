data "template_file" "vcl_recv" {
  template = <<END
        if (req.backend == F_default_backend && ($${vcl_recv_condition})) {
            set req.backend = $${backend_name};
        }
END

  vars {
    vcl_recv_condition = "${var.vcl_recv_condition}"
    backend_name       = "${var.backend_name}"
  }
}

module "vcl_backend" {
  source = "github.com/mergermarket/tf_fastly_routing_config_vcl_backend"

  backend_name = "${var.backend_name}"
  connect_timeout = "${var.connect_timeout}"
  dynamic = "${var.dynamic}"
  first_byte_timeout = "${var.first_byte_timeout}"
  between_bytes_timeout = "${var.between_bytes_timeout}"
  max_connections = "${var.max_connections}"
  backend_port = "${var.backend_port}"
  backend_host = "${var.backend_host}"
  ssl_cert_hostname = "${var.ssl_cert_hostname}"
  ssl_sni_hostname = "${var.ssl_sni_hostname}"
  ssl_ca_cert = "${var.ssl_ca_cert}"
  ssl_check_cert = "${var.ssl_check_cert}"
  probe_enabled = "${var.probe_enabled}"
  probe_threshold = "${var.probe_threshold}"
  probe_window = "${var.probe_window}"
  probe_initial = "${var.probe_initial}"
  probe_interval = "${var.probe_interval}"
  probe_timeout = "${var.probe_timeout}"
  healthcheck_path = "${var.healthcheck_path}"
}
