# Download base image ubuntu 22.04
FROM ubuntu:22.04

# LABEL about the custom image
LABEL maintainer="chyiyaqing@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for the ssh-server"

ENV TERM xterm

# Frist need to install an SSH Server
RUN apt-get update && apt-get install -y --no-install-recommends \
    openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apy/list/*

RUN mkdir -p /var/run/sshd \
    && mkdir /root/.ssh \
    && chmod 700 /root/.ssh \
    && touch /root/.ssh/authprized_keys

COPY bin/* /usr/local/bin/

EXPOSE 22

ENTRYPOINT ["ssh-start"]
CMD ["ssh-start"]
