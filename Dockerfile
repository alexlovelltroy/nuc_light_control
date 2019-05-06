from debian:stretch-slim as builder-base
RUN apt-get -y update
RUN apt-get -y install build-essential debhelper dkms kmod unzip 
RUN curl -LO https://github.com/alexlovelltroy/intel_nuc_led/archive/master.zip && unzip master.zip
RUN mv intel_nuc_led-master /root/intel_nuc_led

# Build for kernel 4.9.0-3
from builder-base as builder-4.9.0-3-amd64
RUN apt-get -y install linux-headers-4.9.0-3-amd64
ENV KVERSION=4.9.0-3-amd64
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.9.0-4
from builder-base as builder-4.9.0-4-amd64
RUN apt-get -y install linux-headers-4.9.0-4-amd64
ENV KVERSION=4.9.0-4-amd64
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.9.0-5
from builder-base as builder-4.9.0-5-amd64
RUN apt-get -y install linux-headers-4.9.0-5-amd64
ENV KVERSION=4.9.0-5-amd64
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.9.0-6
from builder-base as builder-4.9.0-6-amd64
RUN apt-get -y install linux-headers-4.9.0-6-amd64
ENV KVERSION=4.9.0-6-amd64
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.9.0-7
from builder-base as builder-4.9.0-7-amd64
RUN apt-get -y install linux-headers-4.9.0-7-amd64
ENV KVERSION=4.9.0-7-amd64
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.9.0-8
from builder-base as builder-4.9.0-8-amd64
RUN apt-get -y install linux-headers-4.9.0-8-amd64
ENV KVERSION=4.9.0-8-amd64
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.9.0-9
from builder-base as builder-4.9.0-9-amd64
RUN apt-get -y install linux-headers-4.9.0-9-amd64
ENV KVERSION=4.9.0-9-amd64
RUN cd /root/intel_nuc_led && make clean && make dkms-install

from alpine as base
RUN apk update --no-cache && apk add kmod --no-cache

from base
ADD https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl 

COPY ring_init.sh /root/

RUN mkdir -p /root/4.9.0-3-amd64/
COPY --from=builder-4.9.0-3-amd64 /lib/modules/4.9.0-3-amd64/updates/dkms/nuc_led.ko  /root/4.9.0-3-amd64/nuc_led-1.0.ko
RUN mkdir -p /root/4.9.0-4-amd64/
COPY --from=builder-4.9.0-4-amd64 /lib/modules/4.9.0-4-amd64/updates/dkms/nuc_led.ko  /root/4.9.0-4-amd64/nuc_led-1.0.ko
RUN mkdir -p /root/4.9.0-5-amd64/
COPY --from=builder-4.9.0-5-amd64 /lib/modules/4.9.0-5-amd64/updates/dkms/nuc_led.ko  /root/4.9.0-5-amd64/nuc_led-1.0.ko
RUN mkdir -p /root/4.9.0-6-amd64/
COPY --from=builder-4.9.0-6-amd64 /lib/modules/4.9.0-6-amd64/updates/dkms/nuc_led.ko  /root/4.9.0-6-amd64/nuc_led-1.0.ko
RUN mkdir -p /root/4.9.0-7-amd64/
COPY --from=builder-4.9.0-7-amd64 /lib/modules/4.9.0-7-amd64/updates/dkms/nuc_led.ko  /root/4.9.0-7-amd64/nuc_led-1.0.ko
RUN mkdir -p /root/4.9.0-8-amd64/
COPY --from=builder-4.9.0-8-amd64 /lib/modules/4.9.0-8-amd64/updates/dkms/nuc_led.ko  /root/4.9.0-8-amd64/nuc_led-1.0.ko
RUN mkdir -p /root/4.9.0-9-amd64/
COPY --from=builder-4.9.0-9-amd64 /lib/modules/4.9.0-9-amd64/updates/dkms/nuc_led.ko  /root/4.9.0-9-amd64/nuc_led-1.0.ko

VOLUME /writeable_proc

WORKDIR /root/

ENV COLOR=blue

CMD ["./ring_init.sh","nuc_led-1.0.ko"]
