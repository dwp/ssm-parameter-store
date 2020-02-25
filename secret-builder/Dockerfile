FROM alpine:3.11 as BASE

RUN echo @testing http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

RUN apk update

FROM BASE as SECRET

RUN apk add bash \
    openssh-client \
    gawk \
    git \
    git-secret@testing

FROM SECRET

COPY git-setup.sh .
RUN chmod +x git-setup.sh
ENTRYPOINT [ "./git-setup.sh" ]