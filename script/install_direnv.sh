#!/bin/sh

mkdir -p ~/.tmp
git clone http://github.com/zimbatm/direnv ~/.tmp/direnv
cd ~/.tmp/direnv
make install

