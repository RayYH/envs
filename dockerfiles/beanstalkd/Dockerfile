FROM alpine:3
LABEL maintainer="Rayyh <rayyounghong@gmail.com>"

RUN apk add --no-cache beanstalkd

EXPOSE 11300
ENTRYPOINT ["/usr/bin/beanstalkd"]