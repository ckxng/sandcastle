Sandstorm Base
=========

Secure by default Sandstorm installation with nginx reverse proxy and base
Debian setup.

**Status**: alpha, initial release, not to be depended on :)

Requirements
------------

Root access to a Debian Jessie installation.

A wildcard TLS certificate. (must be copied to the box before this role runs, see [test.yml](test.yml))

Role Variables
--------------

* **sandstorm_hostname**: defaults to `{{ansible_fqdn}}`
* **sandstorm_port**: defaults to `6080`
* **sandstorm_dev_accounts**: defaults to `"false"`, set to `"yes"` to enable
  (note: must be the string "yes", with quotes)
* **ssl_certificate_path**: path provided to the nginx ssl_certificate config value
* **ssl_certificate_key_path**: path provided to the nginx ssl_certificate_key config value
* **ssl_trusted_certificate_path**: path provided to the nginx ssl_trusted_certificate config value

See the [nginx configuration
docs](http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_certificate)
for details on the SSL fields.

Dependencies
------------

* jnv.unattended-upgrades
* geerlingguy.firewall
* hardening.os-hardening

Example Playbook
----------------

See [test.yml](test.yml)

You can see `test.yml` in action with Vagrant:

* `vagrant plugin install landrush` (on linux there is some additional
  configuration that you need to get dnsmasq working, checkout [the
  docs](https://github.com/phinze/landrush#visibility-on-the-host) for more
  info)
* `virtualenv .venv`
* `source .venv/bin/activate`
* `pip install ansible`
* `ansible-galaxy install -p dependencies -r requirements.txt`
* `cd test && ./gen-test-cert.sh && cd ..`
* Add `test/rootCA.pem` to your browsers trusted authorities list (**note!**
  while this is added to your browser anyone with access to rootCA.key will be
  able to compromise your TLS connections)
* `vagrant up`
* Navigate to https://sandstorm.io.vagrant.dev

License
-------

MIT
Copyright (c) <2015> <Jack Singleton et al.>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Author Information
------------------

* Matt Urbanski (iflowfor8hours)
* Charlie Austin (charltonaustin)
* Jack Singleton (jacksingleton)

