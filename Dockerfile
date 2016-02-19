#
# Official Ceylon build image
#
FROM ceylon/base-debian-ceylon:java7

MAINTAINER Tako Schotanus <tako@ceylon-lang.org>

LABEL org.ceylon-lang.dockerfile.description="Official Ceylon build image" \
     org.ceylon-lang.dockerfile.vendor="RedHat" \
     org.ceylon-lang.dockerfile.version="1.4"

USER root

RUN mkdir /output && \
    touch /output/.novolume && \
    chown -R ceylon:ceylon /output

VOLUME /output

USER ceylon

ADD build.sh /home/ceylon/build.sh

ENTRYPOINT ["/home/ceylon/build.sh"]
CMD [""]

