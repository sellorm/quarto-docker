FROM ubuntu:22.04

ENV QUARTO_VERSION=0.9.315

RUN apt update ; \
    apt install -y curl ;  \
    curl -o quarto.tar.gz -L \
    "https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.tar.gz" ; \
    mkdir -p /opt/quarto/${QUARTO_VERSION} ; \
    tar -zxvf quarto.tar.gz -C /opt/quarto/${QUARTO_VERSION} \
    --strip-components=1 ; \
    rm quarto.tar.gz ; \
    ln -s /opt/quarto/${QUARTO_VERSION}/bin/quarto /usr/local/bin/quarto


ENTRYPOINT /bin/bash
