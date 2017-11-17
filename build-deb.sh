#!/bin/sh
set -eux

docker run -v $(pwd):/opt/rkt debian:sid /bin/bash -c "\
  cd /opt/rkt && \
  ./scripts/install-deps-debian-sid.sh && \
  ./autogen.sh && \
  ./configure --with-stage1-flavors=coreos --enable-tpm=no --enable-sdjournal=no && \
  make && \
  apt-get install -y ruby ruby-dev && \
  gem install fpm && \
  cd /opt/rkt/scripts/pkg && \
  BUILDDIR=/opt/rkt/build-rkt-1.29.1/ ./build-pkgs.sh 1.29.1 && \
  mv /opt/rkt/build-rkt-1.29.1/target/bin/rkt_1.29.1-1_amd64.deb /opt/rkt/rkt_1.29.1-1_amd64.deb"
