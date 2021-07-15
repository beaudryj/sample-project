ARG DEBIAN_VERSION

FROM debian:${DEBIAN_VERSION} AS base
# Wanted to make image more flexible for newer LTC versions
ARG LITECOIN_VERSION
ENV LITECOIN_DATA=/home/litecoin/.litecoin

# Fetching Dependencies
RUN apt-get update -y \
    && apt-get install -y wget jq\ 
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Wanted to use a slightly less obvious user role name
RUN useradd -ms /bin/bash worker

# Fetching Litecoin installer and Signatures
RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz 
RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-linux-signatures.asc 
RUN checksum=$(sha256sum litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz) \ 
    && check=$(cat litecoin-${LITECOIN_VERSION}-linux-signatures.asc | grep "$checksum") \
    && if [ -n "$check" ]; then echo "checksum matched"; else echo "the checksum of the downloaded .tar.gz did not match the one provided by litecoin.org" >&2; exit 1; fi \
# Wanted to just fetch down to required files instead of hacking around with moves
    && tar -xzvf litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz -C /usr/local/bin --strip 2 \
# Cleaning up Fetched assets
    && rm *.tar.gz *.asc

# What an annoying bug with non root users... such an old bug too - https://github.com/moby/moby/issues/2259#issuecomment-48286811
RUN mkdir -p /home/worker/.litecoin; chown -R worker:worker /home/worker/.litecoin

VOLUME ["/home/worker/.litecoin"]

# Setting to Non root user
USER worker

# Exposing out default ports 
EXPOSE 9332 9333 19332 19333 19444

COPY scripts/healthcheck.sh /healthcheck.sh

HEALTHCHECK --interval=5m --timeout=30s \
    CMD ./healthcheck.sh

ENTRYPOINT ["litecoind"]

CMD ["litecoind"]