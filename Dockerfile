FROM innovanon/builder as builder
COPY ./dpkg.list                     \
     ./policy.sed /tmp/
RUN sleep 31                         \
 && apt update                       \
 && apt full-upgrade                 \
 && test -x       /tmp/dpkg.list     \
 && apt install $(/tmp/dpkg.list)    \
 && test -x       /tmp/policy.sed    \
 &&               /tmp/policy.sed -i \
    /etc/ImageMagick-6/policy.xml    \
 && rm -v         /tmp/dpkg.list     \
                  /tmp/policy.sed

