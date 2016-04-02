FROM docker.io/ubuntu:14.04
MAINTAINER Akihiro Matsushima <amatsusbit@gmail.com>

ENV LD_LIBRARY_PATH=/opt/sailfish-0.6.3_trusty/lib

RUN apt-get update && \
    apt-get install -y autoconf cmake g++ libbz2-dev patch unzip wget zlib1g-dev && \
    bash -c "tar zxf <(wget -O - https://github.com/kingsfordgroup/sailfish/archive/v0.6.3.tar.gz) -C /opt" && \
    cd /opt/sailfish-0.6.3 && \
    wget -O boost-cstdint.patch \
        https://svn.boost.org/trac/boost/changeset/84950\?format=diff\&new=84950 && \
    patch -p1 < <(wget -O - \
        https://raw.githubusercontent.com/amatsus/dockerized-sailfish/trusty-0.6.3/cmakelists.patch) && \
    cmake -DCMAKE_INSTALL_PREFIX=/opt/sailfish-0.6.3_trusty -DFETCH_BOOST=TRUE && \
    make && make install && \
    rm -rf /opt/sailfish-0.6.3 && \
    wget -O /usr/local/bin/run_wrapper.py \
        https://raw.githubusercontent.com/gifford-lab/docker_signal_wrapper/master/run_wrapper.py && \
    sed -i "s/env python/env python3/" /usr/local/bin/run_wrapper.py && \
    chmod +x /usr/local/bin/run_wrapper.py

ENTRYPOINT [ "/usr/local/bin/run_wrapper.py", "/opt/sailfish-0.6.3_trusty/bin/sailfish" ]
CMD ["--help"]
