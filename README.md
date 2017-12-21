# tf\_fastly\_routing\_config terraform module

[![Build Status](https://travis-ci.org/mergermarket/tf_fastly_routing_config.svg?branch=master)](https://travis-ci.org/mergermarket/tf_fastly_routing_config)

This module is for generating fastly routing config for inclusion in a custom
VCL file. This is mainly useful for use building up the `custom_vcl_backends`
and `custom_vcl_recv` parameters to
[tf\_fastly\_frontend](https://github.com/mergermarket/tf_fastly_frontend)
(these allow for a variable number of backends to be supplied via a parameter -
something that isn't currently possible in ordinary terraform).

## Interface

To see all the input variables and outputs see `variables.tf` and `outputs.tf`.
The required input variables are:

* `vcl_recv_condition` - when to route to the backend as a VCL condition (see
https://docs.fastly.com/guides/conditions/using-conditions).
* `backend_name` - the name of the backend (must be unique across backends).

The outputs are:

* `vcl_recv` - fragment of VCL to add to `custom_vcl_recv`.
* `vcl_backend` - fragment of VCL to add to custom\_vcl\_backends`.
