import unittest
import os
import re
import json
from subprocess import check_call, check_output

cwd = os.getcwd()

def optional_whitespace(pattern):
    '''
    Replaces whitespace in the provided pattern with a pattern that matches
    optional whitespace.
    '''
    return re.sub(r'\s+', r'\s*', pattern)

class TestConfigGeneration(unittest.TestCase):

    def setUp(self):
        check_call(['terraform', 'init', 'test/infra'])
        check_call(['terraform', 'get', 'test/infra'])
        self.output = check_output([
            'terraform', 'apply',
            '-var', 'defaults_vcl_recv_condition=test-cond',
            '-var', 'defaults_backend_name=test-backend',
            '-var', 'defaults_backend_host=test-host',
            '-var', 'ssl_ca_cert=line 1\nline 2\nline 3\n',
            '-var', 'ssl_check_cert=never',
            'test/infra'
        ]).decode('utf-8')


    def test_vcl_recv(self):
        self.assertRegexpMatches(
            self.output,
            re.compile(optional_whitespace(r'''
                defaults_vcl_recv =
                if \( test-cond \) \{
                    set req\.backend \= test-backend\;
                    if \(req\.request == "HEAD" \|\| req\.request == "GET" \|\| req\.request == "FASTLYPURGE"\) \{
                        return\(lookup\);
                    else \{
                        return\(pass\);
                    \}
                \}
            '''), re.X)
        )


    def test_backend_defaults(self):
        self.assertRegexpMatches(
            self.output,
            re.compile(optional_whitespace(r'''
                defaults_vcl_backend =
                backend test-backend \{
                    \.connect_timeout = 5s ;
                    \.dynamic = true ;
                    \.first_byte_timeout = 20s ;
                    \.between_bytes_timeout = 20s ;
                    \.max_connections = 1000 ;
                    \.port = "443" ;
                    \.host = "test-host" ;
                    \.ssl = true ;
                    \.ssl_cert_hostname = "test-host" ;
                    \.ssl_check_cert = always ;
                    \.probe = \{
                        \.request = "HEAD \s /internal/healthcheck HTTP/1.1" \s "Connection: \s close";
                        \.window = 2 ;
                        \.threshold = 1 ;
                        \.timeout = 5s ;
                        \.initial = 1 ;
                        \.interval = 60s ;
                        \.dummy = true ;
                    \}
                \}
            '''), re.X)
        )

    def test_ssl_ca_cert(self):
        self.assertRegexpMatches(
            self.output,
            re.compile(optional_whitespace(r'''
                ssl_ca_cert_vcl_backend =
                backend dummy-backend \{
                    \.connect_timeout = 5s ;
                    \.dynamic = true ;
                    \.first_byte_timeout = 20s ;
                    \.between_bytes_timeout = 20s ;
                    \.max_connections = 1000 ;
                    \.port = "443" ;
                    \.host = "dummy-host" ;
                    \.ssl = true ;
                    \.ssl_cert_hostname = "dummy-host" ;
                    \.ssl_ca_cert = \{"line 1\nline 2\nline 3\n"\} ;
                    \.ssl_check_cert = always ;
                    \.probe = \{
                        \.request = "HEAD \s /internal/healthcheck HTTP/1.1" \s "Connection: \s close";
                        \.window = 2 ;
                        \.threshold = 1 ;
                        \.timeout = 5s ;
                        \.initial = 1 ;
                        \.interval = 60s ;
                        \.dummy = true ;
                    \}
                \}
            '''), re.X)
        )

    def test_ssl_check_cert_never(self):
        self.assertRegexpMatches(
            self.output,
            re.compile(optional_whitespace(r'''
                ssl_check_cert_vcl_backend =
                backend dummy-backend \{
                    \.connect_timeout = 5s ;
                    \.dynamic = true ;
                    \.first_byte_timeout = 20s ;
                    \.between_bytes_timeout = 20s ;
                    \.max_connections = 1000 ;
                    \.port = "443" ;
                    \.host = "dummy-host" ;
                    \.ssl = true ;
                    \.ssl_cert_hostname = "dummy-host" ;
                    \.ssl_check_cert = never ;
                    \.probe = \{
                        \.request = "HEAD \s /internal/healthcheck HTTP/1.1" \s "Connection: \s close";
                        \.window = 2 ;
                        \.threshold = 1 ;
                        \.timeout = 5s ;
                        \.initial = 1 ;
                        \.interval = 60s ;
                        \.dummy = true ;
                    \}
                \}
            '''), re.X)
        )
