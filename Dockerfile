FROM akito13/alpine
LABEL maintainer="Akito <the@akito.ooo>" \
      version="0.1.0"
RUN apk update            && \
    apk add --update curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x ./kubectl    && \
    mv ./kubectl /usr/bin/kubectl && \
    apk del curl
RUN rm -fr /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*