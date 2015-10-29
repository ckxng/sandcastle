#!/usr/bin/env bash

# requires apache2-utils to be installed
dos_https() {
  ab -n 600 -c 10 https://sandstorm.io.vagrant.dev/
}

dos_ssh() {
  # come up with some code to bang on the ssh door
true
}
