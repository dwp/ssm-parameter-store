FROM alpine:3.11 as BASE

RUN echo @testing http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories

RUN apk update

FROM BASE as SECRET

RUN apk add bash \
    openssh-client \
    gawk \
    git \
    git-secret@testing \
    curl \
    openssl \
    ca-certificates

FROM SECRET as CERTS
RUN echo | openssl s_client -showcerts -servername server -connect github.com:443 > /usr/local/share/ca-certificates/cacert.pem \
    && update-ca-certificates 2>&1 > /dev/null

FROM CERTS

COPY git-setup.sh .
RUN chmod +x git-setup.sh
ENTRYPOINT [ "./git-setup.sh" ]
