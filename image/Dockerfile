FROM debian:stable-20241016-slim
RUN set -x && \
    export version=1.0.20 && \
    apt update && apt upgrade -y && \
    apt install -y wget libglib2.0-0 libevent-2.1-7 libevent-pthreads-2.1-7 libwim15 libhivex0  && \
    cd /tmp  && \
    wget "https://github.com/ventoy/PXE/releases/download/v$version/iventoy-$version-linux-free.tar.gz"  && \
    tar -xvf ./iventoy-$version-linux-free.tar.gz  && \
    rm -Rf ./iventoy-$version/iso/  && \
    rm -Rf ./iventoy-$version/data/config.dat  && \
    mkdir -p /run/iventoy && \
    cp -Rvf ./iventoy-$version/* /run/iventoy/  && \
    chmod +x /run/iventoy/lib/iventoy && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
COPY --chmod=755 run-and-log.sh /run/
WORKDIR /run/iventoy/
ENV IVENTOY_API_ALL=1 
ENV IVENTOY_AUTO_RUN=1 
EXPOSE 80
ENTRYPOINT ["/run/run-and-log.sh"]