FROM debian:stable-20241016-slim
ADD https://github.com/ventoy/PXE/releases/download/v1.0.20/iventoy-1.0.20-linux-free.tar.gz /tmp/
RUN set -x && \
    export version=1.0.20 && \
    apt update && apt upgrade -y && \
    cd /tmp  && \
    tar -xvf ./iventoy-$version-linux-free.tar.gz  && \
    rm -Rf ./iventoy-$version/iso/  && \
    rm -Rf ./iventoy-$version/data/config.dat  && \
    mkdir -p /opt/iventoy/iso && mkdir -p /opt/iventoy/data &&\
    cp -Rvf ./iventoy-$version/* /opt/iventoy/  && \
    chmod +x /opt/iventoy/lib/iventoy && \
    apt-get clean autoclean && \
    apt-get autoremove --yes && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/
COPY --chmod=755 run-and-log.sh /run/
WORKDIR /opt/iventoy/
ENV IVENTOY_API_ALL=1 
ENV IVENTOY_AUTO_RUN=1 
EXPOSE 80
ENTRYPOINT ["/run/run-and-log.sh"]