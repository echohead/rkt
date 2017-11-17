# unattended

docker run -v $SRC:/opt/rkt debian:sid /bin/bash -c "cd /opt/rkt && ./scripts/install-deps-debian-sid.sh && ./autogen.sh && ./configure --with-stage1-flavors=coreos && make && cd /opt/rkt/scripts/pkg && BUILDDIR=/opt/rkt/build-rkt-1.29.0/ ./build-pkgs.sh 1.29.0"

ls /opt/rkt/build-rkt-1.29.0/target/bin/rkt_1.29.0-1_amd64.deb



# interactive

docker run -it --rm -v $SRC:/opt/rkt debian:sid /bin/bash

(in container)
cd /opt/rkt && ./scripts/install-deps-debian-sid.sh && ./autogen.sh && ./configure --with-stage1-flavors=coreos && make && apt-get install -y ruby ruby-dev && gem install fpm && cd /opt/rkt/scripts/pkg && BUILDDIR=/opt/rkt/build-rkt-1.29.0/ ./build-pkgs.sh 1.29.0
