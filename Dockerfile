FROM ubuntu:20.04

ARG UID=${UID}

ARG GID=${GID}

ARG UNAME=${UNAME}

ARG GO_VERSION=${GO_VERSION}

RUN apt update && apt install git wget make gcc g++ -y

RUN wget https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz

RUN tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz

RUN groupadd -g ${GID} ${UNAME} && useradd -u ${UID} ${UNAME} -g ${UNAME}

ENV PATH=$PATH:/usr/local/go/bin

USER ${UID}

WORKDIR /home/${UNAME}/src/