FROM alpine

MAINTAINER Guillermo Garcia "ggarcia@realidadfutura.com"

# ENV TZ=Europe/Madrid

# RUN date \
#  && apk add -U tzdata \
#  && cp /usr/share/zoneinfo/$TZ /etc/localtime \
#  && echo $TZ > /etc/timezone \
#  && date

RUN apk update \
 && apk add -U python py-setuptools python-dev git gcc musl-dev \
 && rm -r /var/cache/

RUN git clone git://github.com/tgalal/yowsup.git \
  && cd yowsup \
  && python ./setup.py install

VOLUME ["/root/.yowsup"]

ENTRYPOINT ["yowsup-cli"]
