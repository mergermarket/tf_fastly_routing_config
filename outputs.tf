output "vcl_recv" {
  value = "${data.template_file.vcl_recv.rendered}"
}

output "backend" {
  value = "${data.template_file.backend.rendered}"
}
