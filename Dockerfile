FROM ubuntu:latest
MAINTAINER blacktop, https://github.com/blacktop

#Prevent daemon start during install
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d

RUN \
  apt-get update -q && \
  apt-get install -y software-properties-common

# Install Volatility
RUN \
  add-apt-repository -y ppa:pi-rho/security && \
  apt-get update && \
  apt-get install -y volatility
# RUN add-apt-repository ppa:pi-rho/security
# RUN apt-get -q update
# RUN apt-get install volatility

ENTRYPOINT ["volatility"]

CMD ["-h"]
