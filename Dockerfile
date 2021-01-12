FROM innovanon/builder as builder
COPY ./dpkg.list                     \
     ./policy.sed /tmp/
RUN sleep 91                         \
 && apt update                       \
 && apt full-upgrade                 \
 && test -x       /tmp/dpkg.list     \
 && apt install $(/tmp/dpkg.list)    \
 && test -x       /tmp/policy.sed    \
 &&               /tmp/policy.sed -i \
    /etc/ImageMagick-6/policy.xml    \
 && rm -v         /tmp/dpkg.list     \
                  /tmp/policy.sed    \
 && git config --global http.proxy socks5h://127.0.0.1:9050
USER lfs
RUN git config --global http.proxy socks5h://127.0.0.1:9050

FROM scratch as squash
COPY --from=builder / /

