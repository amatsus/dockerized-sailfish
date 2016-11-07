FROM docker.io/ubuntu:14.04
MAINTAINER Akihiro Matsushima <amatsusbit@gmail.com>

ENV LD_LIBRARY_PATH=/opt/sailfish-0.10.1_trusty/lib \
    PATH=/opt/sailfish-0.10.1_trusty/bin:$PATH

RUN apt-get update && \
    apt-get install -y autoconf cmake curl g++ libbz2-dev unzip zlib1g-dev && \
    bash -c "tar zxf <(curl -L https://github.com/kingsfordgroup/sailfish/archive/v0.10.1.tar.gz) -C /opt" && \
    cd /opt/sailfish-0.10.1 && \
    cmake -DCMAKE_INSTALL_PREFIX=/opt/sailfish-0.10.1_trusty -DFETCH_BOOST=TRUE -DNO_RTM=TRUE && \
    make && make install && \
    rm -rf /opt/sailfish-0.10.1 && \
    curl -Lo /usr/local/bin/run_wrapper.py \
        https://raw.githubusercontent.com/gifford-lab/docker_signal_wrapper/master/run_wrapper.py && \
    chmod +x /usr/local/bin/run_wrapper.py

ENTRYPOINT [ "/usr/local/bin/run_wrapper.py", "/opt/sailfish-0.10.1_trusty/bin/sailfish" ]
CMD ["--help"]
