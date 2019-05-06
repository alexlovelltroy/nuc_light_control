from ubuntu:18.04 as builder-base
RUN apt-get -y update
RUN apt-get -y install build-essential debhelper dkms kmod unzip 
RUN curl -LO https://github.com/alexlovelltroy/intel_nuc_led/archive/master.zip && unzip master.zip
RUN mv intel_nuc_led-master /root/intel_nuc_led

# Build for kernel 4.15.0-20-generic
from builder-base as builder-4.15.0-20-generic
RUN apt-get -y install linux-headers-4.15.0-20-generic
ENV KVERSION=4.15.0-20-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-23-generic
from builder-base as builder-4.15.0-23-generic
RUN apt-get -y install linux-headers-4.15.0-23-generic
ENV KVERSION=4.15.0-23-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-30-generic
from builder-base as builder-4.15.0-30-generic
RUN apt-get -y install linux-headers-4.15.0-30-generic
ENV KVERSION=4.15.0-30-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-32-generic
from builder-base as builder-4.15.0-32-generic
RUN apt-get -y install linux-headers-4.15.0-32-generic
ENV KVERSION=4.15.0-32-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-33-generic
from builder-base as builder-4.15.0-33-generic
RUN apt-get -y install linux-headers-4.15.0-33-generic
ENV KVERSION=4.15.0-33-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-36-generic
from builder-base as builder-4.15.0-36-generic
RUN apt-get -y install linux-headers-4.15.0-36-generic
ENV KVERSION=4.15.0-36-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-38-generic
from builder-base as builder-4.15.0-38-generic
RUN apt-get -y install linux-headers-4.15.0-38-generic
ENV KVERSION=4.15.0-38-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-39-generic
from builder-base as builder-4.15.0-39-generic
RUN apt-get -y install linux-headers-4.15.0-39-generic
ENV KVERSION=4.15.0-39-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-42-generic
from builder-base as builder-4.15.0-42-generic
RUN apt-get -y install linux-headers-4.15.0-42-generic
ENV KVERSION=4.15.0-42-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-43-generic
from builder-base as builder-4.15.0-43-generic
RUN apt-get -y install linux-headers-4.15.0-43-generic
ENV KVERSION=4.15.0-43-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-44-generic
from builder-base as builder-4.15.0-44-generic
RUN apt-get -y install linux-headers-4.15.0-44-generic
ENV KVERSION=4.15.0-44-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-45-generic
from builder-base as builder-4.15.0-45-generic
RUN apt-get -y install linux-headers-4.15.0-45-generic
ENV KVERSION=4.15.0-45-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-46-generic
from builder-base as builder-4.15.0-46-generic
RUN apt-get -y install linux-headers-4.15.0-46-generic
ENV KVERSION=4.15.0-46-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-47-generic
from builder-base as builder-4.15.0-47-generic
RUN apt-get -y install linux-headers-4.15.0-47-generic
ENV KVERSION=4.15.0-47-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install

# Build for kernel 4.15.0-48-generic
from builder-base as builder-4.15.0-48-generic
RUN apt-get -y install linux-headers-4.15.0-48-generic
ENV KVERSION=4.15.0-48-generic
RUN cd /root/intel_nuc_led && make clean && make dkms-install


from alpine as base
RUN apk update --no-cache && apk add kmod --no-cache

from base
ADD https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl /usr/bin/kubectl
RUN chmod +x /usr/bin/kubectl 

COPY ring_init.sh /root/

RUN mkdir -p /root/4.15.0-20-generic/
COPY --from=builder-4.15.0-20-generic /lib/modules/4.15.0-20-generic/updates/dkms/nuc_led.ko  /root/4.15.0-20-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-23-generic/
COPY --from=builder-4.15.0-23-generic /lib/modules/4.15.0-23-generic/updates/dkms/nuc_led.ko  /root/4.15.0-23-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-30-generic/
COPY --from=builder-4.15.0-30-generic /lib/modules/4.15.0-30-generic/updates/dkms/nuc_led.ko  /root/4.15.0-30-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-32-generic/
COPY --from=builder-4.15.0-32-generic /lib/modules/4.15.0-32-generic/updates/dkms/nuc_led.ko  /root/4.15.0-32-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-33-generic/
COPY --from=builder-4.15.0-33-generic /lib/modules/4.15.0-33-generic/updates/dkms/nuc_led.ko  /root/4.15.0-33-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-30-generic/
COPY --from=builder-4.15.0-30-generic /lib/modules/4.15.0-30-generic/updates/dkms/nuc_led.ko  /root/4.15.0-30-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-36-generic/
COPY --from=builder-4.15.0-36-generic /lib/modules/4.15.0-36-generic/updates/dkms/nuc_led.ko  /root/4.15.0-36-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-38-generic/
COPY --from=builder-4.15.0-38-generic /lib/modules/4.15.0-38-generic/updates/dkms/nuc_led.ko  /root/4.15.0-38-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-42-generic/
COPY --from=builder-4.15.0-42-generic /lib/modules/4.15.0-42-generic/updates/dkms/nuc_led.ko  /root/4.15.0-42-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-43-generic/
COPY --from=builder-4.15.0-43-generic /lib/modules/4.15.0-43-generic/updates/dkms/nuc_led.ko  /root/4.15.0-43-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-44-generic/
COPY --from=builder-4.15.0-44-generic /lib/modules/4.15.0-44-generic/updates/dkms/nuc_led.ko  /root/4.15.0-44-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-45-generic/
COPY --from=builder-4.15.0-45-generic /lib/modules/4.15.0-45-generic/updates/dkms/nuc_led.ko  /root/4.15.0-45-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-46-generic/
COPY --from=builder-4.15.0-46-generic /lib/modules/4.15.0-46-generic/updates/dkms/nuc_led.ko  /root/4.15.0-46-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-47-generic/
COPY --from=builder-4.15.0-47-generic /lib/modules/4.15.0-47-generic/updates/dkms/nuc_led.ko  /root/4.15.0-47-generic/nuc_led-1.0.ko

RUN mkdir -p /root/4.15.0-48-generic/
COPY --from=builder-4.15.0-48-generic /lib/modules/4.15.0-48-generic/updates/dkms/nuc_led.ko  /root/4.15.0-48-generic/nuc_led-1.0.ko

VOLUME /writeable_proc

WORKDIR /root/

ENV COLOR=blue

CMD ["./ring_init.sh","nuc_led-1.0.ko"]
