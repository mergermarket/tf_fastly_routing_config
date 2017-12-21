output "vcl_recv" {
  value = "${data.template_file.vcl_recv.rendered}"
}

output "vcl_backend" {
  value = "${data.template_file.vcl_backend.rendered}"
}
