FROM frolvlad/alpine-glibc
ENV MOUNT_DIR=/home/source/rrys
RUN apk update && apk upgrade && apk add libstdc++ && apk add --no-cache --virtual .depends wget && \
    mkdir -p /root/rrys && mkdir -p /tmp/rrys  && \
    wget -q https://appdown.rrysapp.com/rrshareweb_centos7.tar.gz  -O /tmp/rrys/rrshareweb_centos7.tar.gz && \
    tar zxvf /tmp/rrys/rrshareweb_centos7.tar.gz -C /root/rrys && \
    rm -rf /tmp/rrys && \
    apk del .depends

EXPOSE 3001 6714 30210
CMD ["sh", "-c", "/root/rrys/rrshareweb/rrshareweb"]