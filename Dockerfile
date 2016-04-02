FROM docker.io/centos:7
MAINTAINER Akihiro Matsushima <amatsusbit@gmail.com>

ENV LD_LIBRARY_PATH=/opt/sailfish-0.9.2_centos7/lib

RUN yum -y update && \
    yum -y install autoconf bzip2-devel cmake gcc-c++ libstdc++-static make unzip which zlib-devel && \
    bash -c "tar zxf <(curl -L https://github.com/kingsfordgroup/sailfish/archive/v0.9.2.tar.gz) -C /opt" && \
    cd /opt/sailfish-0.9.2 && \
    cmake -DCMAKE_INSTALL_PREFIX=/opt/sailfish-0.9.2_centos7 -DFETCH_BOOST=TRUE -DNO_RTM=TRUE && \
    make && make install && \
    rm -rf /opt/sailfish-0.9.2 && \
    curl -Lo /usr/local/bin/run_wrapper.py \
        https://raw.githubusercontent.com/gifford-lab/docker_signal_wrapper/master/run_wrapper.py && \
    chmod +x /usr/local/bin/run_wrapper.py

ENTRYPOINT [ "/usr/local/bin/run_wrapper.py", "/opt/sailfish-0.9.2_centos7/bin/sailfish" ]
CMD ["--help"]
