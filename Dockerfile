FROM innovanon/builder as builder
COPY ./dpkg.list  \
     ./policy.sed /tmp/
RUN apt update                      \
 && apt full-upgrade                \
 && test -x       /tmp/dpkg.list    \
 && apt install $(/tmp/dpkg.list)   \
 && rm -v         /tmp/dpkg.list    \
 && /tmp/policy.sed -i              \
      /etc/ImageMagick-6/policy.xml \
 && rm -v         /tmp/policy.sed

