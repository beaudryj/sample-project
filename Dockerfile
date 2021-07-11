ARG DEBIAN_VERSION

FROM debian:${DEBIAN_VERSION} AS base
ARG LITECOIN_VERSION
ENV LITECOIN_DATA=/home/litecoin/.litecoin

RUN apt-get update -y \
    && apt-get install -y wget \ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -ms /bin/bash worker

RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz 
RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-linux-signatures.asc 
RUN checksum=$(sha256sum litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz) \ 
    && check=$(cat litecoin-${LITECOIN_VERSION}-linux-signatures.asc | grep "$checksum") \
    && if [ -n "$check" ]; then echo "checksum matched"; else echo "the checksum of the downloaded .tar.gz did not match the one provided by litecoin.org" >&2; exit 1; fi \
    && tar -xzvf litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz -C /usr/local/bin --strip 2 \
    && rm *.tar.gz *.asc

USER worker

VOLUME ["/home/litecoin/.litecoin"]

EXPOSE 9332 9333 19332 19333 19444

ENTRYPOINT ["litecoind"]

CMD ["litecoind"]